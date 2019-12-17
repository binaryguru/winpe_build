:: Command template description
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
if ERRORLEVEL 1 GOTO NoExtensions

SET MountedWimDir=%CD%\mount

CLS
ECHO.
ECHO Current directory is: %CD%
ECHO MountedWimDir: %MountedWimDir%
ECHO.

REM COMMANDS GO HERE >>>

REM <<<

ENDLOCAL
EXIT /B

:NoExtensions
ECHO.
ECHO ERROR: No command extensions / delayed variable expansion available.
ENDLOCAL
EXIT /B 1
