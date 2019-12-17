:: Sysinternals_EulaAccepted.cmd
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 GOTO NoExtensions

SET MountedWimDir=%CD%\mount

REG LOAD HKLM\WINPE %MountedWimDir%\Windows\System32\config\SOFTWARE
REG IMPORT Sysinternals_EulaAccepted.reg
REG UNLOAD DHKLM\WINPE
ENDLOCAL
EXIT /B

:NoExtensions
ECHO.
ECHO ERROR: No command extensions / delayed variable expansion available.
ENDLOCAL
EXIT /B 1
