:: Unmount boot.wim
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 GOTO NoExtensions

Dism /Unmount-Wim /MountDir:%CD%\mount /Commit
IF ERRORLEVEL 1 GOTO errUnmount
ENDLOCAL
EXIT /B

:NoExtensions
ECHO ERROR: No command extensions / delayed variable expansion available.
ENDLOCAL
EXIT /B 1

:errMount
ECHO ERROR: Unmounting %CD%\ISO\sources\boot.wim failed.
ENDLOCAL
EXIT /B 3
