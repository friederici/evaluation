#!/bin/bash

./scatter.py measurements/NonePredictor/ measurements/ConstantPredictor/ measurements/LinearPredictor/ measurements/CombiPredictor/ measurements/WaryPredictor/
./boxplot.py measurements/NonePredictor/ measurements/ConstantPredictor/ measurements/LinearPredictor/ measurements/CombiPredictor/ measurements/WaryPredictor/

