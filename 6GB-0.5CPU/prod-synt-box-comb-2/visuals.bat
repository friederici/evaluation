@echo off
setlocal 
  set "YLIM1=180000"
  set "YLIM2=525000"

  cd 5_compound
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\6_compound_square
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\7_compound_square_random
  python ..\..\..\scripts\boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..

endlocal
pause
