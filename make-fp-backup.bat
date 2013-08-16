@echo off
set day=%date:~0,2%
set month=%date:~3,2%
set year=%date:~-4%
set today=%year%-%month%-%day%
set bin="%ProgramFiles%\7-Zip\7z.exe"
set options=a -t7z -mx9
set apppath=c:\
set appdir=fp_server
set appexcl=localDB.*
set appbkp=fp_server
set bkpdir=f:\fp_server_backup
set logdir=%~dp0\log
set logfile=%logdir%\%~n0-%today%.log
set logfilter=findstr /v "Compressing"

if not exist %logdir% mkdir %logdir%

echo. > %logfile%
echo Process start: %time% >> %logfile%

cd /d %apppath%
%bin% %options% %bkpdir%\%appbkp%-%today%.7z .\%appdir%\* -xr!%appexcl% | %logfilter% >> %logfile%
echo 7-zip exit code: %ERRORLEVEL% >> %logfile%

echo Process end: %time% >> %logfile%
