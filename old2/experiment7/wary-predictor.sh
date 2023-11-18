#!/bin/bash

# Run workflow 3_square for 10 times with 15 inputfiles - WaryPredictor

cd /workflows/data/
rm -f *.txt
./createData.py custom 15

cd /workflows/synthetic/3_square/

for i in $(seq 1 10)
do
	make clean
	make dev-run-wary
	zip /evaluation/experiment5/measurements/WaryPredictor/exp5-$i.zip .nextflow.log TaskScaler* trace*
done

