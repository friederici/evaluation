#!/bin/bash

cd 1_const
YLIM1=40000 YLIM2=160000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../2_linear
YLIM1=40000 YLIM2=160000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../3_square
YLIM1=40000 YLIM2=160000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../4_random
YLIM1=40000 YLIM2=160000 python3 ../../../scripts/boxplot.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ..

