@echo off
setlocal

cls
rem Set source and destination
set CALIBRE_SOURCE=%HOMEPATH%\Documents\Calibre\
set BACKUP_DESTINATION=Z:\books\00.calibre\

echo Will mirror all the data, including removing files in source.
echo Source:      "%CALIBRE_SOURCE%"
echo Destination: "%BACKUP_DESTINATION%"
echo -

:prompt
set /P AREYOUSURE=Are you sure? [y/N] 

if /I "%AREYOUSURE%" == "y" (
    call :sync %CALIBRE_SOURCE% %BACKUP_DESTINATION%
) else (
    echo Aborting...
)

pause
setlocal

:sync
    Robocopy.exe /MIR %~1 %~2