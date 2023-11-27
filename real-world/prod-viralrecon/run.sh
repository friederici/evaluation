#!/bin/bash

predictors=( "NonePredictor" "ConstantPredictor" "LinearPredictor" "CombiPredictor" "WaryPredictor" )
config=( "none" "constant" "linear" "combi" "wary" )

basedir=$(pwd)

for i in $(seq 1 1);
do
	for cnf in "${!config[@]}"
	do
		# create measurement folder
		cd $basedir
		echo mkdir -p measurements/${predictors[$cnf]}
		mkdir -p measurements/${predictors[$cnf]}

		predictor=/workflows/config/${config[$cnf]}.config

		# iteration information
		echo $predictor $i
		pwd

		# reset cluster
		/workflows/requirements/clear_cluster.sh
		/workflows/requirements/apply_cluster.sh

		# clear old outputs
		cd /nfs/data/output
		rm -rf *

		# clear old results
		cd /nfs/input/pipelines/viralrecon
		rm -rf work
		rm -rf .nextflow*
		rm Task*

		# run workflow
		echo nextflow run main.nf -config /workflows/config/viralrecon.config -config $predictor --outdir /nfs/data/output --platform illumina --protocol amplicon
		nextflow run main.nf -config /workflows/config/viralrecon.config -config $predictor --outdir /nfs/data/output --platform illumina --protocol amplicon

		# store results
		echo zip $basedir/measurements/${predictors[$cnf]}/result_viralrecon_${config[$cnf]}_$i.zip Task* trace* .nextflow.log*
		zip $basedir/measurements/${predictors[$cnf]}/result_viralrecon_${config[$cnf]}_$i.zip Task* trace* .nextflow.log*
	done
done
