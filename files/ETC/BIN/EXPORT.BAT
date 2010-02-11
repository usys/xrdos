@echo off
if not "x" == "x%9" goto exp9
if not "x" == "x%8" goto exp8
if not "x" == "x%7" goto exp7
if not "x" == "x%6" goto exp6
if not "x" == "x%5" goto exp5
if not "x" == "x%4" goto exp4
if not "x" == "x%3" goto exp3
if not "x" == "x%2" goto exp2
if not "x" == "x%1" goto unexport
goto noarg

:exp9
set %1=%2 %3 %4 %5 %6 %7 %8 %9
goto done
:exp8
set %1=%2 %3 %4 %5 %6 %7 %8
goto done
:exp7
set %1=%2 %3 %4 %5 %6 %7
goto done
:exp6
set %1=%2 %3 %4 %5 %6
goto done
:exp5
set %1=%2 %3 %4 %5
goto done
:exp4
set %1=%2 %3 %4
goto done
:exp3
set %1=%2 %3
goto done
:exp2
set %1=%2
goto done
:exp1
set %1=
goto done

:done
call message.bat "SET %1 = " %2 %3 %4 %5 %6 %7 %8 %9
goto end

:noarg
goto end

:unexport
set %1=
call message.bat "UNSET %1 "
goto end

:end
