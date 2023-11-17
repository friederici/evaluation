#!/bin/bash

# Run workflow 1_const with different number of input files - NonePredictor

for i in $(seq 1 50)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/1_const/
	make clean
	make prod-run-none
	zip /evaluation/experiment2/measurements/NonePredictor/exp2-$i.zip .nextflow.log TaskScaler* trace*
done

