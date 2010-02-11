@echo off
if # == #%2 goto end
if not exist %2 goto end
if #CMD == #%1 goto runcmd


%1 %2 %3 %4 %5 %6 %7 %8 %9
goto end

:runcmd
%2 %3 %4 %5 %6 %7 %8 %9

:end
