@echo off
setlocal enableDelayedExpansion
set WORKINGDIR=%~dp1
REM extracts filepath from argument
cd %WORKINGDIR%
for /F "delims=" %%i in ('dir /B /D *.desktop') do (
REM for loop against every url file in directory
  set FILENAME1=%%~snxi
  REM DOS-compatible file name and extension
  set FILENAME2=%%~ni
  REM actual file name
  for /F %%k in ('findstr /R /I URL= !FILENAME1!') do @set URLLINE=%%k
  REM finds regular expression, case insensitive, of line containing URL=, stores in URLLINE
  (echo [InternetShortcut] && echo !URLLINE!) > "!FILENAME2!.URL"
  REM every echo comand creates a newline
)
