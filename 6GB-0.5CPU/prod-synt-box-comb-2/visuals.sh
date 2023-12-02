#!/bin/bash

cd 5_compound
YLIM1=180000 YLIM2=525000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../6_compound_square
YLIM1=180000 YLIM2=525000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../7_compound_square_random
YLIM1=180000 YLIM2=525000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ..

