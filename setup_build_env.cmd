:: Set up a Windows PE build environment
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 GOTO NoExtensions

IF EXIST "%CD%\ISO\boot\BOOTFIX.BIN" DEL "%CD%\ISO\boot\BOOTFIX.BIN"
IF EXIST "%CD%\winpe.wim" (
    COPY /VY "%CD%\winpe.wim" "%CD%\ISO\sources\boot.wim"
    IF ERRORLEVEL 1 GOTO errCopy
    ENDLOCAL
    EXIT /B
) ELSE (
    ECHO.
    ECHO ERROR: Missing %CD%\winpe.wim
    ENDLOCAL
    EXIT /B 3
)

:NoExtensions
ECHO.
ECHO ERROR: No command extensions / delayed variable expansion available.
ENDLOCAL
EXIT /B 1

:errCopy
ECHO.
ECHO ERROR: Copying %CD%\winpe.wim failed.
ENDLOCAL
EXIT /B 2
