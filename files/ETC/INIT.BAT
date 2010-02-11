@echo off
rem init.bat
rem Usage: init.bat FS_ROOT bootLevel Args...
set FS_DEBUG=
if NOT X_goto == X%1 goto root
shift
goto %1
goto root

:_testfile
shift
if "X%1" == "X" goto eof
for %%i in (%PATH%) do if exist %%i\%1 goto _testfile
REM if exist %FS_ROOT%etc\bin\%1 goto _testNfile
echo Error! File not exist : %1
set FS_ERROR=FNE
goto eof

rem restore oldpath
rem if NOT X == X%FS_ROOT% call %FS_ROOT%etc\bin\frun.bat call %FS_ROOT%etc\bin\oldpath.bat

rem Save OLD PATH


:root
if X == X%1 goto no_root
SET FS_ROOT=%1
goto set_path
:no_root
IF NOT "X%FS_ROOT%" == "X" goto set_path
CD | NSET.COM FS_ROOT=$0
:set_path
echo PATH %PATH%> %FS_ROOT%etc\bin\_oldpath.bat
REM SET FS_PATH=%PATH%
IF NOT "X%PATH%" == "X" set PATH=%FS_ROOT%etc\bin;%PATH%
if "X%PATH%" == "X" set PATH=%FS_ROOT%etc\bin
:testFile
%FS_DEBUG%
call %0 _goto _testfile frun.bat message.bat echox.com try.bat addpath.bat pathdel.bat
if "X%FS_ERROR%" == "X" goto init_s
echo Init will not continue
goto abort

:init_s
if "%2"=="s" goto rcS
if "%2"=="S" goto rcS



:rc0
    call message "Setting video mode"
    call %0 _goto _testfile vga.com
rem	call frun.bat %FS_BIN%\vga.com font %FS_ROOT%etc\fonts\8\thin_ss.f08
	vga.com font %FS_ROOT%etc\fonts\10\blcksnsf.f10
	vga.com pal %FS_ROOT%etc\pals\whtbl
:skip_video	
    
REM	%FS_BIN%\mode.com con: cols=80 lines=25	
REM	%FS_BIN%\mode.com con: cols=80 lines=50
	
    call export.bat FS_ROOT %FS_ROOT%
    if "%FS_ROOT%"=="A:\" goto skip_tmp

    if X == X%TMP% call export.bat TMP %FS_ROOT%tmp
    if not exist %TMP%\NUL mkdir %TMP%

:skip_tmp

IF "%2"=="DOSBOX" goto dosbox_skip
rem	call vga.exe /l /c %FS_BIN%\vga.rc
REM	call try call "Loading NANSI.SYS" %FS_BIN%\devload.com /a %FS_BIN%\nansi.sys >NUL
:dosbox_skip

REM	call TRY CALL "Set text color" textmode.bat 1 32 40

if "%2"=="CLEAN" goto rcS
if "%2"=="CD"   goto rc2
if "%2"=="EMM386" goto rc3
if "%2"=="UMBPCI" goto rc3
if "%2"=="EMMCD" goto rc4
if "%2"=="UMBCD" goto rc4
if "%2"=="SHUTDOWN" goto rc6
if "%2"=="REBOOT" goto rc6

if "%2"=="1" goto rc1
if "%2"=="2" goto rc2
if "%2"=="3" goto rc3
if "%2"=="4" goto rc4
if "%2"=="5" goto rc5
if "%2"=="6" goto rc6
goto rc1

:rcS
    set FS_ROOT=
    set FS_ETC=
    set FS_BIN=
    set FS_PATH=

goto end

:rc1
:rc2
:rc3
:rc4
:rc5
    call frun.bat call %FS_ROOT%etc\init.d\Sys.bat %FS_ROOT%etc\sys.d %2 %3 %4 %5 %6 %7 %8 %9
    call frun.bat call %FS_ROOT%etc\init.d\App.bat %FS_ROOT%etc\app.d %2 %3 %4 %5 %6 %7 %8 %9
    call frun.bat call %FS_ROOT%etc\init.d\Work.bat %FS_ROOT%etc\work.d %2 %3 %4 %5 %6 %7 %8 %9
    call frun.bat call %FS_ROOT%etc\init.d\Auto.bat %FS_ROOT%etc\auto.d %2 %3 %4 %5 %6 %7 %8 %9
    goto finish
:rc6
    call frun.bat call %FS_ROOT%etc\init.d\clean.bat
    call frun.bat call %FS_ROOT%etc\init.d\shutdown.bat
    goto finish



:abort
    call %FS_ROOT%etc\bin\_oldpath.bat
    set FS_ROOT=
    set FS_ETC=
    set FS_BIN=
    set FS_PATH=
    set FS_ERROR=
    goto eof
:finish
rem    call message.bat Finished
    call pathdel.bat %FS_ROOT%ETC\BIN
    set FS_ETC=
    set FS_BIN=
    set FS_PATH=
:end
:eof
:_return




