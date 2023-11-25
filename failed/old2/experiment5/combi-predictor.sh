#!/bin/bash

# Run workflow 2_linear for 10 times with 15 inputfiles - CombiPredictor

cd /workflows/data/
rm -f *.txt
./createData.py custom 15

cd /workflows/synthetic/2_linear/

for i in $(seq 1 10)
do
	make clean
	make dev-run-combi
	zip /evaluation/experiment5/measurements/CombiPredictor/exp5-$i.zip .nextflow.log TaskScaler* trace*
done

