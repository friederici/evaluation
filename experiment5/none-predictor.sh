#!/bin/bash

# Run workflow 2_linear for 10 times with 15 inputfiles - NonePredictor

cd /workflows/data/
rm -f *.txt
./createData.py custom 15

cd /workflows/synthetic/3_square/

for i in $(seq 1 10)
do
	make clean
	make dev-run-none
	zip /evaluation/experiment5/measurements/NonePredictor/exp5-$i.zip .nextflow.log TaskScaler* trace*
done

