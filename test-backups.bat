@echo off &chcp 1251 >nul
@setlocal enableextensions
@cd /d "%~dp0"

set day=%date:~0,2%
set month=%date:~3,2%
set year=%date:~-4%
set today=%year%-%month%-%day%

set logdir=%~dp0logs
set logok=%logdir%\%~n0_%today%_all-ok.log
set lognodir=%logdir%\%~n0_%today%_no-dir.log
set logarcherror=%logdir%\%~n0_%today%_archerror.log
set errfilter=%logdir%\tmperror.txt
set testlist=%logdir%\testlist.txt
set testdir=%~dp0backup_%today%

if not exist %logdir% md %logdir%
if exist %testlist% del /q %testlist%
if exist %errfilter% del /q %errfilter%
if exist %logok% del /q %logok%
if exist %lognodir% del /q %lognodir%
if exist %logarcherror% del /q %logarcherror%

if not exist %testdir%\nul goto end

dir %testdir%\*.zip /b /s >%testlist%
dir %testdir%\*.rar /b /s >>%testlist%
dir %testdir%\*.7z /b /s >>%testlist%
dir %testdir%\*.xz /b /s >>%testlist%

if not exist "%errfilter%" (
	echo Error: >"%errfilter%"
	echo Errors: >>"%errfilter%"
)

for /f "delims=" %%f in (%testlist%) do (
	title %%f
	"%ProgramFiles%\7-Zip\7z.exe" t "%%f"|findstr /g:"%errfilter%" &&(
		echo %%f &echo.
		echo %%f>>%logarcherror%
	)
)

title Done.

if exist %logarcherror% (
	echo Archives with errors:
	type %logarcherror% |more
) else echo All archives OK! >%logok%

del /q %testlist%
del /q %errfilter%
pause &exit /b

:end
echo %testdir% folder doesn't exist
echo %testdir% folder doesn't exist >%lognodir%
//pause &exit /b
