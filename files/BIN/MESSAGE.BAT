@ECHO off


if X == %PRNPREFIX%X goto nop1
if X == %PRNHEAD%X goto noh2

%BIN_D%echox "[ %PRNPREFIX% %PRNHEAD% ] "
goto getopt

:nop1
if X == X%PRNHEAD% goto noh1
%BIN_D%echox "[ %PRNHEAD% ] "
goto getopt

:noh1
REM %BIN_D%echox " "
goto getopt

:noh2
%BIN_D%echox "[ %PRNPREFIX% ] "

:getopt
if #-e  == #%1 goto opt_e
if #-n  == #%1 goto opt_n
if #-en == #%1 goto msg_en
if #-ne == #%1 goto msg_en
%BIN_D%echox %1 %2 %3 %4 %5 %6 %7 %8 %9
echo.
goto end

:opt_e
if #-n == #%2 goto msg_en2
%BIN_D%echox -e %2 %3 %4 %5 %6 %7 %8 %9
echo.
goto end

:opt_n
if #-e == #%2 goto msg_en2
%BIN_D%echox %2 %3 %4 %5 %6 %7 %8 %9
goto end


:msg_en
%BIN_D%echox -e %2 %3 %4 %5 %6 %7 %8 %9
goto end

:msg_en2
%BIN_D%echox -e %3 %4 %5 %6 %7 %8 %9


:END

