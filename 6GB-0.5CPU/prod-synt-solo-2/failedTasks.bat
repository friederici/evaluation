@echo off

cd 1_const
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\2_linear
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\3_square
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\4_random
python ..\..\..\scripts\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..
pause
