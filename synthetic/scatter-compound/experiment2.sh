#!/bin/bash

workflows=( "5_compound" "6_compound_square" "7_compound_square_random" )
predictors=( "NonePredictor" "ConstantPredictor" "LinearPredictor" "CombiPredictor" "WaryPredictor" )
maketarget=( "none" "constant" "linear" "combi" "wary" )

basedir=$(pwd)

for n in $(seq 1 3)
do
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
			for i in $(seq 1 3 50)
			do
				# iteration information
				echo -n "$n $i "
				echo -n "prod-run-${maketarget[$pd]} : "
				echo $wf/measurements/${predictors[$pd]}

				# create dataset
				cd /workflows/data/
				rm -f *.txt
				./reproducibleData.py $i

				# change to workflow
				cd /workflows/synthetic/$wf/

				# clean, run, zip
				make clean
				pwd
				date
				echo make prod-run-${maketarget[$pd]}
				make prod-run-${maketarget[$pd]}
				echo zip $basedir/$wf/measurements/${predictors[$pd]}/exp-${maketarget[$pd]}-$i-$n.zip .nextflow.log TaskScaler* trace*
				zip $basedir/$wf/measurements/${predictors[$pd]}/exp-${maketarget[$pd]}-$i-$n.zip .nextflow.log TaskScaler* trace*
			done
		done
	done
done

