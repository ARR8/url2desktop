@echo off
setlocal enableDelayedExpansion
set WORKINGDIR=%~dp1
cd %WORKINGDIR%
for /F "delims=" %%i in ('dir /B /D *.URL') do (
  set FILENAME1=%%~snxi
  set FILENAME2=%%~ni
  for /F %%k in ('findstr /R /I URL= !FILENAME1!') do @set URLLINE=%%k
  (echo [Desktop Entry] && echo Type=Link && echo !URLLINE!) > "!FILENAME2!.desktop"
)
