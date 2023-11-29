@echo off
setlocal 
  REM set "YLIM1=180000"
  REM set "YLIM2=525000"
  python ..\..\scripts/boxplot.py .\measurements\NonePredictor\ .\measurements\ConstantPredictor\ .\measurements\LinearPredictor\ .\measurements\CombiPredictor\ .\measurements\WaryPredictor\
endlocal
pause
