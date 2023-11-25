
cd 1_const
python ..\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
move *.png ../

cd ..\2_linear
python ..\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
move *.png ../

cd ..\3_square
python ..\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
move *.png ../

cd ..\4_random
python ..\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
move *.png ../
