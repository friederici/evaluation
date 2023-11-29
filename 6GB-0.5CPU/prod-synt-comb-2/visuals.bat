@echo off
setlocal 
  set "YLIM1=0"
  set "YLIM2=840000"

  cd 5_compound
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\6_compound_square
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\7_compound_square_random
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

endlocal
pause
