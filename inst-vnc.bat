@echo off &chcp 1251 > nul
psexec -h -u infocom\vg \\tester03 \\fs\pub\_inv\remote\install.bat
