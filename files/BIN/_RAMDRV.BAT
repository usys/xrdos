@echo off
if NOT X == X%ramdrv% goto end
if X == X%1 goto usage
REM if not exist %BIN_D%xmsdsk.exe goto err_file
REM if not exist %BIN_D%findramd.bat goto err_fr
if exist XMSXXXX0 goto _xmsok
goto _xmsok
goto err_xms


:_xmsok
call %BIN_D%findramd.bat
if X == X%ramdrv% goto err_drv
%BIN_D%xmsdsk.exe %1 %ramdrv% /y >NUL
if errorlevel 1 goto end
set ramdrv=
goto end

:usage
echo Usage %0 (disk size)
goto end

:err_drv
echo NO DRIVE LETTER AVAILABLE FOR RAMDISK
goto end


:err_xms
echo ERROR: No XMS manager installed.
goto end

:end
