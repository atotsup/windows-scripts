@echo off
echo +++++ debug +++++ >> debug.log
echo %date% %time:~,-3% >> debug.log
echo 1=%1 >> debug.log
echo 2=%2 >> debug.log
echo 3=%3 >> debug.log
echo 4=%4 >> debug.log

set dblog=%3-%2.log

if '%1' == '' (
	echo ERROR: you must specify _path_!
	echo %date% %time:~,-3% ERROR: you must specify _path_! >> error.log
	goto EXIT
)

if "%2" == "" (
	echo ERROR: you must specify _name_! [_path_=%1]
	echo %date% %time:~,-3% ERROR: you must specify _name_! [_path_=%1] >> error.log
	goto EXIT
)

if "%3" == "" (
	echo ERROR: you must specify _cfgtype_! [_path_=%1 _name_=%2]
	echo %date% %time:~,-3% ERROR: you must specify _cfgtype_! [_path_=%1 _name_=%2] >> error.log
	goto EXIT
)

if "%3" == "acc" (
	goto CONTINUE
)

if "%3" == "hrm" (
	goto CONTINUE
)

:ERRORCFG
echo ERROR: _cfgtype_ must be 'acc' or 'hrm'! [_path_=%1 _name_=%2 _type_=%3 _ver_=%4]
echo %date% %time:~,-3% ERROR: _cfgtype_ must be 'acc' or 'hrm'! [_path_=%1 _name_=%2 _type_=%3 _ver_=%4] >> error.log
goto EXIT

:EXIT
echo ----- debug ----- >> debug.log
exit /b 1

:CONTINUE
set bin="C:\Program Files\1cv82\8.2.16.368\bin\1cv8.exe"
set dbuser=admin
set dbpass=somepass

set dbpath=%1
set dbname=%3-%2
set cfgtype=%3

if "%4" == "" (
	set updatestr=/UpdateDBCfg
	set updatemsg=update %dbname%
) else (
	set updatestr=/UpdateCfg e:\1Cdatabases\_updatecfg\%3\%4\1cv8.cfu /UpdateDBCfg
	set updatemsg=update %dbname% to version %4
)

echo +++++++ Starting %updatemsg% +++++++++ >> %dblog%
echo %date% %time:~,-3% >> %dblog%
echo Starting %updatemsg% ...
echo %bin% CONFIG /F %dbpath% /N %dbuser% /P %dbpass% %updatestr% /Out %dblog% -NoTruncate >> %dblog%
echo %bin% CONFIG /F %dbpath% /N %dbuser% /P %dbpass% %updatestr% /Out %dblog% -NoTruncate >> debug.log
%bin% CONFIG /F %dbpath% /N %dbuser% /P %dbpass% %updatestr% /Out %dblog% -NoTruncate
echo %date% %time:~,-3% >> %dblog%
echo ------- %updatemsg% completed --------- >> %dblog%
echo ----- debug ----- >> debug.log
