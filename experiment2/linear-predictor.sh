#!/bin/bash

# Run workflow 1_const with different number of input files - LinearPredictor

for i in $(seq 1 50)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/1_const/
	make clean
	make prod-run-linear
	zip /evaluation/experiment2/measurements/LinearPredictor/exp2-$i.zip .nextflow.log TaskScaler* trace*
done

