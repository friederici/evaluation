#!/bin/bash

cd 1_const
YLIM1=0 YLIM2=255000 python3 ../../../scripts/scatter.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../2_linear
YLIM1=0 YLIM2=255000 python3 ../../../scripts/scatter.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../3_square
YLIM1=0 YLIM2=255000 python3 ../../../scripts/scatter.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ../4_random
YLIM1=0 YLIM2=255000 python3 ../../../scripts/scatter.py ./measurements/NonePredictor/ ./measurements/ConstantPredictor/ ./measurements/LinearPredictor/ ./measurements/CombiPredictor/ ./measurements/WaryPredictor/
mv *.pdf ../

cd ..

