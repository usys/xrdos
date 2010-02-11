@echo off

call message.bat -n "Load CD-ROM Drivers? [N/y] "
ask.com -t3 -u>NUL
if errorlevel 89 if not errorlevel 90 goto start
if errorlevel 13 if not errorlevel 14 goto start
echo NO
goto end

:start
echo YES
call devload.com /Q /A %OPENBOOT%bin\cddrv1.sys /D:cd001>NUL
call devload.com /Q /A %OPENBOOT%bin\cddrv2.sys /D:cd002>NUL

CALL testrun.bat shsucdx.com
if NOT X%_error% == X goto mscdex
call try.bat LoadHigh "Loading CD-ROM program" shsucdx.com /Q /D:?cd001 /D:?cd002
call shsucdx.com /D
goto end

:mscdex
CALL testrun.bat mscdex.exe
IF NOT X%_error% == X goto no_prog
call try.bat LoadHigh "Loading CD-ROM program" mscdex.exe /E /D:cd001 /D:cd002
goto end

:no_prog
CALL message.bat "Warning: no CD-ROM program found"
set _error=
goto end



:end
set _error=