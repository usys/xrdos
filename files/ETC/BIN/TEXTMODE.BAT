@ECHO OFF
REM  =============================================== 
REM  FILE:   textmode.bat                     
REM  AUTHOR: xiaoranzzz
REM  DESC:   set text mode,required ansi.sys loaded.
REM  ===============================================

if "%1"=="" GOTO USAGE


:TESTVAR
for %%M in (0,1,2,3,4,5,7,6,8) do if "%1"=="%%M" GOTO SETMODE
for %%M in (30,31,32,33,34,35,36,37) do if "%1"=="%%M" GOTO SETMODE
for %%M in (40,41,42,43,44,45,46,47) do if "%1"=="%%M" GOTO SETMODE
echo Invalid value %1
GOTO END


:SETMODE
echox -e \e[%1m
shift
if "%1"=="" GOTO END
GOTO TESTVAR

:USAGE
echo %0 mode [mode...]
echo.
echo Text attributes mode:
echox -n "0  : All off" # "1  : Bold on" # "4  : Underscore" 
echox -n "5  : Blink on" # "7  : Reverse video on" # "8  : Cancealed on"
echo.
echo Text color mode:
echox -n "30 : Black" # "31 : Red" # "32 : Green" # "33 : Yellow"
echox -n "34 : Blue" # "35 : Magenta" # "36 : Cyan" # "37 : White"
echo.
echo Text background color mode:
echox -n "40 : Black" # "41 : Red" # "42 : Green" # "43 : Yellow"
echox -n "44 : Blue" # "45 : Magenta" # "46 : Cyan" # "47 : White"

:END
rem echox -e "                                                          \r"
