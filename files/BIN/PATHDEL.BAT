@echo off
REM Delete component in %PATH%
if X == X%1 goto usage
if X_GOTO == X%1 goto %2
set _newpath=

for %%i in (%PATH%) do if not "%%i" == "%1" call %0 _GOTO addpath %%i
set PATH=%_newpath%
set _newpath=
goto end

:addpath
if not "%_newpath%" == "" set _newpath=%_newpath%;%3
if "%_newpath%" == "" set _newpath=%3
goto end

:usage
echo %0
echo     - Delete specified pathname in %%PATH%%
echo Usage:
echo   %0 (pathname)
goto end


:end