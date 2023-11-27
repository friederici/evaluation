@echo off

cd 1_const
python ..\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\2_linear
python ..\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\3_square
python ..\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..\4_random
python ..\summary.py measurements\NonePredictor measurements\ConstantPredictor measurements\LinearPredictor measurements\CombiPredictor measurements\WaryPredictor

cd ..
pause
