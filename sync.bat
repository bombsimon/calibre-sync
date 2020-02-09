@echo off
setlocal EnableDelayedExpansion 
cls

set MASTER=%HOMEPATH%\Documents\Calibre\
set SLAVE=Z:\books\00.calibre\

:loop
    rem Loop until user exits or syncs
    call :show_sync
    call :prompt "Are you sure? [y/N] "

    if /I "%AREYOUSURE%" EQU "y" (
        call :sync %MASTER% %SLAVE%
        goto :stop
    )

    call :prompt "Swap direction [y/N] "
    if /I "%AREYOUSURE%" NEQ "y" (
        echo Aborting...
        goto :stop
    )

    call :swap MASTER SLAVE !SLAVE! !MASTER!
    goto :loop

:stop
    rem Pause before exiting application
    pause

endlocal
exit /B 0

:sync
    rem Call robocopy to mirror master to slave
    Robocopy.exe /MIR %~1 %~2
    exit /B 0

:swap
    rem Swap two variables
    set "%~1=%~3"
    set "%~2=%~4"

    exit /B 0

:show_sync
    rem Display message to show which way to synchronize
    echo Will mirror all the data, including removing files in source.
    echo Source:      "!MASTER!"
    echo Destination: "!SLAVE!"
    echo -

    exit /B 0

:prompt
    rem Prompt user and store response
    set /P AREYOUSURE=%~1
    exit /B 0