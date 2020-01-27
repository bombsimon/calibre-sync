@echo off
setlocal

cls
rem Set source and destination
set MASTER=%HOMEPATH%\Documents\Calibre\
set SLAVE=Z:\books\00.calibre\

echo Will mirror all the data, including removing files in source.
echo Source:      "%MASTER%"
echo Destination: "%SLAVE%"
echo -

:prompt
set /P AREYOUSURE=Are you sure? [y/N] 

if /I "%AREYOUSURE%" == "y" (
    call :sync %MASTER% %SLAVE%
) else (
    echo Aborting...
)

pause
setlocal

:sync
    Robocopy.exe /MIR %~1 %~2
