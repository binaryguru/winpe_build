:: Copy gimagex to boot.wim
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 GOTO NoExtensions

IF "%1"=="" GOTO displayHelp
IF "%~1"=="/?" GOTO displayHelp
IF "%1"=="x86" GOTO setVars32
IF "%1"=="amd64" GOTO setVars64
GOTO badSwitch

:setVars32
SET MountedWimDir=%CD%\mount
SET GImageX=%CD%\tools\gimagex\x86\gimagex.exe
GOTO copyTool

:setVars64
SET MountedWimDir=%CD%\mount
SET GImageX=%CD%\tools\gimagex\x64\gimagex_x64.exe
GOTO copyTool

:copyTool
IF EXIST "%GImageX%" (
	COPY /VY "%GImageX%" "%MountedWimDir%\Windows\System32\gimagex.exe"
    IF ERRORLEVEL 1 GOTO errCopy
    ENDLOCAL
    EXIT /B
) ELSE (
	ECHO ERROR: "%GImageX%" missing.
    ENDLOCAL
	EXIT /B 3
)

:displayHelp
ECHO.
ECHO Usage: %0 [x86 ^| amd64]
ECHO.
ECHO Example: %0 x86
ENDLOCAL
EXIT /B

:NoExtensions
ECHO.
ECHO ERROR: No command extensions / delayed variable expansion available.
ENDLOCAL
EXIT /B 1

:badSwitch
ECHO.
ECHO ERROR: Bad switch.
ECHO.
ECHO For help use /?
ENDLOCAL
EXIT /B 1

:errCopy
ECHO.
ECHO ERROR: Copy failed.
ENDLOCAL
EXIT /B 2
