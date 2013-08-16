@echo off
set day=%date:~0,2%
set month=%date:~3,2%
set year=%date:~-4%
set today=%year%-%month%-%day%
set bkpdir=%~dp0backup_%today%
set logdir=%~dp0logs
set logfile=%logdir%\%~n0-%today%.log

if not exist %logdir% md %logdir%
if not exist %bkpdir% md %bkpdir%

cd %bkpdir%

echo Start process: %time% > %logfile%
echo. >> %logfile%

for /f "tokens=* delims=," %%a in ("oracledb,vfp,vcp,jira,wiki,svn,teamcity,1c,ats") do md %%a

xcopy \\fs\!backups\jira-wiki\jira*%today%*dump jira\ >> %logfile%
xcopy \\fs\!backups\jira-wiki\jira-appdata.tar.xz jira\ >> %logfile%
xcopy \\fs\!backups\jira-wiki\confluence*%today%*dump wiki\ >> %logfile%
xcopy \\fs\!backups\jira-wiki\confluence-appdata.tar.xz wiki\ >> %logfile%
xcopy \\fs\!backups\sonar\* sonar\ >> %logfile%
xcopy \\fs\!backups\teamcbkp\TeamCity_Backup_%year%%month%%day%*.zip teamcity\ >> %logfile%
xcopy \\fs\!backups\teamcbkp\plugins.zip teamcity\ >> %logfile%
xcopy \\fs\!backups\teamcbkp\buildAgent2.zip teamcity\ >> %logfile%
xcopy \\fs\!backups\svnbkp\process*%year%%month%%day%*.zip svn\ >> %logfile%
xcopy \\fs\!backups\svnbkp\mod_python.zip svn\ >> %logfile%
xcopy \\fs\!backups\svnbkp\svnconf.zip svn\ >> %logfile%
xcopy \\FS\E$\1Cbackup\week\* 1c\ >> %logfile%

echo. >> %logfile%
echo End process: %time% >> %logfile%
