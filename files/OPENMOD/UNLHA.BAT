@echo off
if X-x == X%1 goto autorun
echo call %FS_ROOT%bin\try.bat CMD " -- %1" %FS_ROOT%bin\lhe.com x -xnc %1 %2>>%3
goto end
:autorun
shift
echo if exist %2\autorun.bat del %2\autorun.bat>>%3
echo call bin\try.bat CMD " -- %1" bin\lhe.com x -xnc %1 %2>>%3
echo if exist %2\autorun.bat for %%%%i in (call del) do %%%%i %2\autorun.bat>>%3
rem echo if exist %2\autorun.bat del %2\autorun.bat>>%3
:end