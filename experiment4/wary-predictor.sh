#!/bin/bash

# Run workflow 2_linear with 30 of input files

cwd=$(pwd)

cd /workflows/data/
rm -f *.txt
./reproducibleData.py 30
cd /workflows/synthetic/2_linear/

for i in $(seq 1 15)
do
	make clean
	make prod-run-wary
	zip $cwd/measurements/WaryPredictor/exp-$i.zip .nextflow.log TaskScaler* trace*
done

