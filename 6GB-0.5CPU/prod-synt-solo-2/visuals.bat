@echo off
setlocal 
  set "YLIM1=0"
  set "YLIM2=255000"

  cd 1_const
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\2_linear
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\3_square
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

  cd ..\4_random
  python ..\..\..\scripts\scatter.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
  move *.pdf ../

endlocal
pause
