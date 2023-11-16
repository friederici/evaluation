#!/bin/bash

# Run workflow 1_constant with different number of input files

for i in $(seq 1 10)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/1_const/
	make clean
	make dev-run-combi
	zip /evaluation/experiment1/measurements/CombiPredictor/exp1-$i.zip .nextflow.log TaskScaler* trace*
done

