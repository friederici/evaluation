#!/bin/bash

# Run workflow 2_linear with different number of input files

for i in $(seq 1 10)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/2_linear/
	make clean
	make dev-run-wary
	zip /evaluation/experiment3/measurements/WaryPredictor/exp3-$i.zip .nextflow.log TaskScaler* trace*
done

