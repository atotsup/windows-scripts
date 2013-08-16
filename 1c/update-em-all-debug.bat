@echo off

call update.bat
call update.bat "some:\\path\example"
call update.bat "some:\\path\example" somedbname
call update.bat "some:\\path\example" somedbname somedbtype
call update.bat "some:\\path\example" somedbname somedbtype someversion
