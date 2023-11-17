#!/bin/bash

# Run workflow 1_const with different number of input files - ConstantPredictor

for i in $(seq 1 50)
do
	cd /workflows/data/
	rm -f *.txt
	./reproducibleData.py $i
	cd /workflows/synthetic/1_const/
	make clean
	make prod-run-constant
	zip /evaluation/experiment2/measurements/ConstantPredictor/exp2-$i.zip .nextflow.log TaskScaler* trace*
done

