@echo off
cd 5_compound
python ..\comparison.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\

cd ..\6_compound_square
python ..\comparison.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\

cd ..\7_compound_square_random
python ..\comparison.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\

cd ..
pause
