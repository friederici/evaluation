@echo off
setlocal 
  set "YLIM1=40000"
  set "YLIM2=160000"

  cd 1_const
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\2_linear
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\3_square
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\4_random
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

endlocal
pause
