#!/bin/bash

# Run workflow 1_const with different number of input files - ConstantPredictor

cwd=$(pwd)

for i in $(seq 1 25)
do
	cd /workflows/data/
	rm -f *.txt
	./reproducibleData.py $i
	cd /workflows/synthetic/1_const/
	make clean
	make prod-run-constant
	zip $cwd/measurements/ConstantPredictor/exp-$i.zip .nextflow.log TaskScaler* trace*
done

