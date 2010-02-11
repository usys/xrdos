@echo off
if X == X%1 goto noarg
if X == X%2 goto noset
%BIN_D%fpath.com %1 /P | %BIN_D%NSET.com /U %2=$1
goto end

:noarg
%BIN_D%fpath.com %0 /P
goto end

:noset
%BIN_D%fpath.com %1 /P
:end