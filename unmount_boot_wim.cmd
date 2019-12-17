:: Unmount boot.wim
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
if ERRORLEVEL 1 GOTO NoExtensions

CLS
ECHO.
ECHO Current directory is: %CD%
ECHO.

ECHO Unmounting %CD%\ISO\sources\boot.wim
Dism /Unmount-Wim /MountDir:%CD%\mount /Commit

ENDLOCAL
EXIT /B

:NoExtensions
ECHO.
ECHO ERROR: No command extensions / delayed variable expansion available.
EXIT /B 1
