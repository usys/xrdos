@echo off
REM %1  == Type (Call,Load,LoadHigh,CMD)
REM %2  == Name
REM %3  == Pathname
REM %4  == Arguments (Optional)

if "%3"=="" goto END
if not "%2" == "NULL" call %BIN_D%message -n "%2..."
rem call %FS_ROOT%bin\message -n "%2..."
goto %1>NUL
goto CALL
goto END

:CMD
%3 %4 %5 %6 %7 %8 %9> %tmp%\try.out
goto Tried

:Call
call %3 %4 %5 %6 %7 %8 %9> %tmp%\try.out
goto Tried

:Load
load %3 %4 %5 %6 %7 %8 %9> %tmp%\try.out
goto Tried

:LoadHigh
LoadHIGH %3 %4 %5 %6 %7 %8 %9> %tmp%\try.out
goto Tried

:Tried
IF not errorlevel 0 goto Failed
%BIN_D%echox -e "\b\b\b\r\n"
goto END

:Failed
%BIN_D%echox -e "\b\b\b\tFailed\r\n"
echo %1 %2 %3 %4 %5 %6 %7 %8 %9>> %tmp%\errors.txt
type %tmp%\try.out>> %tmp%\errors.txt
goto END

:NoFile
%BIN_D%echox -e "\b\b\b\tError"
echo %1 %2 %3 %4 %5 %6 %7 %8 %9>> %tmp%\errors.txt
echo (%1 not exist!)>> %tmp%\errors.txt
goto END

:END

