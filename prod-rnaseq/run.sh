#!/bin/bash

config=( "none" "constant" "linear" "combi" "wary" )

basedir=$(pwd)

for cnf in "${!config[@]}"
do

	for i in $(seq 1 11);
	do
		predictor=/workflows/config/${config[$cnf]}.config

		# iteration information
		echo $predictor $i

		# reset cluster
		#/workflows/requirements/clear_cluster.sh
		#/workflows/requirements/apply_cluster.sh

		# clear old outputs
		#cd /nfs/data/output
		#rm -rf *

		# clear old results
		#cd /nfs/input/pipelines/rnaseq
		#rm -rf work
		#rm -rf .nextflow*
		#rm Task*

		# run workflow
		echo nextflow run main.nf -config /workflows/config/rnaseq.config -config $predictor --outdir /nfs/data/output
		#nextflow run main.nf -config /workflows/config/rnaseq.config -config $predictor --outdir /nfs/data/output

		# store results
		#zip /workflows/rnaseq/result_rnaseq_$i.zip Task* trace* .nextflow.log*
	done

done
