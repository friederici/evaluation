#!/bin/bash

# Run workflow 1_constant with different number of input files

for i in $(seq 1 30)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/1_const/
	make clean
	make prod-run-constant
	zip /evaluation/experiment2/measurements/ConstantPredictor/exp2-$i.zip .nextflow.log TaskScaler* trace*
done

