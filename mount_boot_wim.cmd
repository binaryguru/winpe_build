:: Mount boot.wim for editing
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 GOTO NoExtensions

IF EXIST %CD%\ISO\sources\boot.wim (
	Dism /Mount-Wim /WimFile:"%CD%\ISO\sources\boot.wim" /index:1 /MountDir:"%CD%\mount"
    IF ERRORLEVEL 1 GOTO :errMount
    ENDLOCAL
    EXIT /B
) ELSE (
	ECHO ERROR: %CD%\ISO\sources\boot.wim not found.
    ENDLOCAL
	EXIT /B 2
)

:NoExtensions
ECHO ERROR: No command extensions / delayed variable expansion available.
ENDLOCAL
EXIT /B 1

:errMount
ECHO ERROR: Mounting %CD%\ISO\sources\boot.wim failed.
ENDLOCAL
EXIT /B 3
