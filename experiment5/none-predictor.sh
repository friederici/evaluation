#!/bin/bash

# Run workflow 3_square with different number of input files

for i in $(seq 1 10)
do
	cd /workflows/data/
	rm -f *.txt
	./createData.py custom $i
	cd /workflows/synthetic/3_square/
	make clean
	make dev-run-none
	zip /evaluation/experiment5/measurements/NonePredictor/exp5-$i.zip .nextflow.log TaskScaler* trace*
done

