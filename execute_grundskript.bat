@echo off
:: BatchGotAdmin
:-------------------------------------
REM Prüfen, ob bereits Admin-Rechte vorhanden sind
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM Wenn Fehlerlevel ungleich 0, keine Admin-Rechte
if '%errorlevel%' NEQ '0' (
    echo Rechte werden angefordert...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%~dp0"
    echo Administrator-Rechte bestätigt. Starte PowerShell-Skript...

    :: PowerShell-Skript mit Admin-Rechten ausführen
    powershell.exe -ExecutionPolicy Bypass -File "%~dp0windows_grundskript.ps1"

    pause
