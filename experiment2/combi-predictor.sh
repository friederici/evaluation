#!/bin/bash

# Run workflow 1_const with different number of input files - CombiPredictor

for i in $(seq 1 50)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/1_const/
	make clean
	make prod-run-combi
	zip /evaluation/experiment2/measurements/CombiPredictor/exp2-$i.zip .nextflow.log TaskScaler* trace*
done

