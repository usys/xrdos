@ECHO OFF
REM cls

if NOT "%1" == "autoexec.bat" goto start
shift
SET OPENBOOT=
SET PATH=
SET XRDOS=
IF EXIST %TMP%\tips.txt del %TMP%\TIPS.TXT 

:start
REM SET OLD_PATH=%PATH%

if NOT "X%1" == "X" goto havearg
SET OLD_PATH=%PATH%
set PATH=bin\;%PATH%
IF "X%0" == "X" call dirname autoexec.bat OPENBOOT
IF NOT "X%0" == "X" call dirname %0 OPENBOOT
set PATH=%OLD_PATH%
SET OLD_PATH=
goto root_done
:havearg
SET OPENBOOT=%1
shift
IF NOT "X%1" == "X" SET CONFIG=%1
shift
:root_done

IF NOT "X%PATH%" == "X" SET PATH=%OPENBOOT%bin;%PATH%
IF "X%PATH%" == "X" SET PATH=%OPENBOOT%bin

if exist %OPENBOOT%etc\banner  type %OPENBOOT%etc\banner
call message "Openboot option [%CONFIG%] selected."
call message "OpenBoot from [%OPENBOOT%]."

if X0 == X%CONFIG% set CONFIG=DEBUG
if X1 == X%CONFIG% set CONFIG=NORMAL
if XXMGR == X%CONFIG% set CONFIG=NORMAL
if X2 == X%CONFIG% set CONFIG=CD
if X3 == X%CONFIG% set CONFIG=EMM386
if X4 == X%CONFIG% set CONFIG=UMBPCI
if X5 == X%CONFIG% set CONFIG=EMMCD
if X6 == X%CONFIG% set CONFIG=UMBCD
if X7 == X%CONFIG% set CONFIG=CLEAN

if XCLEAN == X%CONFIG% goto CLEAN

if NOT XDEBUG == X%CONFIG% goto preload
@echo on
set CONFIG=EMMCD
%COMSPEC% /Y /C autoexec.bat
goto end



:preload
for %%i in (0 1 2 3) do if exist etc\preload%%i.bat call %OPENBOOT%etc\preload%%i.bat
if exist %OPENBOOT%etc\preload.bat call %OPENBOOT%etc\preload.bat


goto %CONFIG%>NUL
SET CONFIG=NORMAL
goto %CONFIG%


:NORMAL
call %OPENBOOT%etc\cdrom.bat
goto config_e


:CD
call %OPENBOOT%etc\cdrom.bat cd001 cd002 cd003 cd004
goto config_e


:EMM386
call %OPENBOOT%etc\cdrom.bat
goto config_e


:UMBPCI
call %OPENBOOT%etc\cdrom.bat
goto config_e


:EMMCD
call %OPENBOOT%etc\cdrom.bat cd001 cd002 cd003 cd004
goto config_e


:UMBCD
call %OPENBOOT%etc\cdrom.bat cd001 cd002 cd003 cd004
goto config_e


:Clean
goto end

:config_e

for %%i in (0 1 2 3) do if exist %OPENBOOT%etc\preint%%i.bat call %OPENBOOT%etc\preint%%i.bat
if exist %OPENBOOT%etc\preint.bat call %OPENBOOT%etc\preint.bat
REM for %%i in (0 1 2 3) do if exist %OPENBOOT%etc\init%%i.bat call %OPENBOOT%etc\init%%i.bat
call %OPENBOOT%etc\init.bat %OPENBOOT% %CONFIG% %1 %2 %3 %4 %5 %6 %7 %8 %9
for %%i in (0 1 2 3) do if exist %OPENBOOT%etc\postint%%i.bat call %OPENBOOT%etc\postint%%i.bat
if exist %OPENBOOT%etc\postint.bat call %OPENBOOT%etc\postint.bat
:end
if exist %TMP%\tips.txt type %TMP%\tips.txt
if exist %OPENBOOT%etc\welcome  type %OPENBOOT%etc\welcome
SET OPENBOOT=
REM if X == X%PATH% PATH A:\BIN
REM set CONFIG=

