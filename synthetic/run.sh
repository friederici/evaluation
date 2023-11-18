#!/bin/bash

workflows=( "1_const" "2_linear" "3_square" "4_random" "5_compound" "6_compound_square" "7_compound_square_random" )
predictors=( "NonePredictor" "ConstantPredictor" "LinearPredictor" "CombiPredictor" "WaryPredictor" )
maketarget=( "none" "constant" "linear" "combi" "wary" )

basedir=$(pwd)

for wf in "${workflows[@]}"
do
	for pd in "${!predictors[@]}"
	do
		mkdir -p $wf/measurements/$pd
		for i in $(seq 1 30)
		do
			# iteration information
			echo -n "$i "
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
			echo make prod-run-${maketarget[$pd]}
			make make prod-run-${maketarget[$pd]}
			echo zip $basedir/$wf/measurements/${predictors[$pd]}/exp-$i.zip .nextflow.log TaskScaler* trace*
			zip zip $basedir/$wf/measurements/${predictors[$pd]}/exp-$i.zip .nextflow.log TaskScaler* trace*
		done
	done
done

