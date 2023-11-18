#!/bin/bash

mkdir -p measurements
mkdir -p measurements/NonePredictor
mkdir -p measurements/ConstantPredictor
mkdir -p measurements/LinearPredictor
mkdir -p measurements/CombiPredictor
mkdir -p measurements/WaryPredictor

./none-predictor.sh
./const-predictor.sh
./linear-predictor.sh
./combi-predictor.sh
./wary-predictor.sh

