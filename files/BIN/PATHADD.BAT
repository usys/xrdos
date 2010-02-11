@ECHO OFF
if "%1"=="" goto Usage
if "%1"=="-a" goto Append
if "%1"=="-n" goto New
goto Prefix

:Usage
echo %0 [option] PATH_VARIBLE
echo - simple batch util for modifing PATH
echo    default to prefixing mode
echo    -a    Appending Mode
echo    -n    Replacing Mode
goto end

:Append
shift
if "%1"=="" goto Usage
for %%i in (%PATH%) do if "%%i" == "%1" goto skip
set PATH=%PATH%;%1
goto ok

:New
shift
if "%1"=="" goto Usage
for %%i in (%PATH%) do if "%%i" == "%1" goto skip
set PATH=%1
goto ok

:Prefix
for %%i in (%PATH%) do if "%%i" == "%1" goto skip
set PATH=%1;%PATH%
goto OK

:skip
echo PATH already contained %1

:OK
:END
