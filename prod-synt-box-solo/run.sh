#!/bin/bash

workflows=( "1_const" "2_linear" "3_square" "4_random" )
predictors=( "NonePredictor" "ConstantPredictor" "LinearPredictor" "CombiPredictor" "WaryPredictor" )
maketarget=( "none" "constant" "linear" "combi" "wary" )

basedir=$(pwd)

for wf in "${workflows[@]}"
do
	for pd in "${!predictors[@]}"
	do
		# reset cluster
		/workflows/requirements/clear_cluster.sh
		/workflows/requirements/apply_cluster.sh

		cd $basedir
		echo mkdir -p $wf/measurements/${predictors[$pd]}
		mkdir -p $wf/measurements/${predictors[$pd]}
		for i in $(seq 1 5)
		do
			# iteration information
			echo -n "$i "
			echo -n "prod-run-${maketarget[$pd]} : "
			echo $wf/measurements/${predictors[$pd]}

			# create dataset
			cd /workflows/data/
			rm -f *.txt
			./reproducibleData.py 20

			# change to workflow
			cd /workflows/synthetic/$wf/

			# clean, run, zip
			make clean
			pwd
			date
			echo make prod-run-${maketarget[$pd]}
			make prod-run-${maketarget[$pd]}
			echo zip $basedir/$wf/measurements/${predictors[$pd]}/exp-$i.zip .nextflow.log TaskScaler* trace*
			zip $basedir/$wf/measurements/${predictors[$pd]}/exp-$i.zip .nextflow.log TaskScaler* trace*
		done
	done
done

