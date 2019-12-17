:: Copy imagex to boot.wim
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
SET ImageX=%ProgramFiles%\Windows AIK\Tools\x86\imagex.exe
GOTO copyTool

:setVars64
SET MountedWimDir=%CD%\mount
SET ImageX=%ProgramFiles%\Windows AIK\Tools\amd64\imagex.exe
GOTO copyTool

:copyTool
IF EXIST "%ImageX%" (
	COPY /VY "%ImageX%" "%MountedWimDir%\Windows\System32"
    IF ERRORLEVEL 1 GOTO :errCopy
    ENDLOCAL
    EXIT /B
) ELSE (
	ECHO ERROR: %ImageX% missing.
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
