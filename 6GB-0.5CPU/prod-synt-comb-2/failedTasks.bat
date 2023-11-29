@echo off

cd 5_compound
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\6_compound_square
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\7_compound_square_random
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..
pause
