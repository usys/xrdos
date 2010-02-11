@ECHO OFF
IF "%1"=="RECALL" GOTO TEST


SET PRNHEAD=XRDOS
call message -n "Searching for extension..."
GOTO RECALL


:TEST
SHIFT
if "%1"=="" GOTO noxrdos
dready.com %1:
IF ERRORLEVEL 255 GOTO TEST
IF ERRORLEVEL 1 GOTO TEST
IF ERRORLEVEL 2 GOTO TEST
SET XRDOS=
IF EXIST %1:\BOOT\XRDOS\IMPORT.BAT SET XRDOS=%1:\BOOT\XRDOS
IF EXIST %1:\DOS\XRDOS\IMPORT.BAT SET XRDOS=%1:\DOS\XRDOS
IF EXIST %1:\XRDOS\IMPORT.BAT SET XRDOS=%1:\XRDOS
IF NOT "%XRDOS%"=="" GOTO HARDDISK
IF EXIST %1:\boot\images\xrdos.lha GOTO RAMDISK
GOTO TEST


:HARDDISK
echo.
call message "Found %XRDOS% "
goto XRDOS

:RAMDISK
echo.
call message "Found %1:\boot\images\xrdos.lha"
if "%ramdrv%"=="" call try.bat call "Setting up ramdisk" _ramdrv.bat 32768
if not "%ramdrv%"=="" goto _ramok
call message "No ramdisk,aborting..."
goto abort

:_ramok
call message "Found ramdisk %ramdrv%"
set XRDOS=%ramdrv%
IF NOT EXIST %XRDOS%\TMP MKDIR %XRDOS%\TMP
SET TEMP=%XRDOS%\tmp
SET TMP=%XRDOS%\tmp
call unlha.bat %1:\boot\images\xrdos.lha %XRDOS%\
GOTO XRDOS

:XRDOS
call message "Importing extension..."
IF EXIST %XRDOS%\IMPORT.BAT call %XRDOS%\import.bat %XRDOS%\
IF EXIST %XRDOS%\AUTOEXEC.BAT call %XRDOS%\AUTOEXEC.BAT %XRDOS%\
goto end

:noxrdos
echo   none.
goto abort

:RECALL
%0 RECALL C Z D Y E X F W G V H U I T J S K R L Q M P N O
GOTO END



:finished
:abort
SET RAMDRV=
SET XRDOS=
:END
SET PRNHEAD=
REM if exist _result.bat call _result.bat