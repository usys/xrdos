@echo off
if X == X%1 goto end
set _error=

:_test
if exist %1 goto _testN
if exist %1.com goto _testN
if exist %1.exe goto _testN
if exist %1.bat goto _testN
for %%i in (%PATH%) do if exist %%i\%1 goto _testN
for %%i in (%PATH%) do if exist %%i\%1.com goto _testN
for %%i in (%PATH%) do if exist %%i\%1.exe goto _testN
for %%i in (%PATH%) do if exist %%i\%1.bat goto _testN
rem echo Command not found: %1
set _error=%1
:_testN
shift
if NOT "X%1" == "X" goto _test
goto end

:end