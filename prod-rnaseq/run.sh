#!/bin/bash

maketarget=( "none" "constant" "linear" "combi" "wary" )

basedir=$(pwd)

for mt in "${!maketarget[@]}"
do

	for i in $(seq 1 11);
	do
		# iteration information
		echo $mt $i

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
		#nextflow run main.nf -config /workflows/config/rnaseq.config -config /workflows/config/wary.config --outdir /nfs/data/output

		# store results
		#zip /workflows/rnaseq/result_rnaseq_$i.zip Task* trace* .nextflow.log*
	done

done
