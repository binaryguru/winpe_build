:: Copy SysinternalsSuite-Nano to boot.wim
@ECHO OFF

VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
if ERRORLEVEL 1 GOTO NoExtensions

SET MountedWimDir=%CD%\mount
SET SysinternalsDir=%CD%\tools\sysinternals

CLS
ECHO.
ECHO Current directory is: %CD%
ECHO MountedWimDir: %MountedWimDir%
ECHO SysinternalsDir: %SysinternalsDir%
ECHO.

:RemoveTools
FOR /F %%X IN ('DIR /B/D %SysinternalsDir%\*.exe') DO (
	SET FILENAME=%%X
	FOR /F "tokens=1,2 delims=64" %%A IN ("!FILENAME!") DO (
		SET BEFORE_UNDERSCORE=%%A
		SET AFTER_UNDERSCORE=%%B
		IF EXIST %CD%\mount\Windows\System32\%%A%%B (
			DEL %CD%\mount\Windows\System32\%%A%%B>nul
			ECHO %CD%\mount\Windows\System32\%%A%%B deleted.
		) ELSE (
			ECHO %CD%\mount\Windows\System32\%%A%%B not found.
		)
		IF EXIST %CD%\mount\Windows\System32\!FILENAME! (
			DEL %CD%\mount\Windows\System32\!FILENAME!>nul
			ECHO %CD%\mount\Windows\System32\!FILENAME! deleted.
		) ELSE (
			ECHO %CD%\mount\Windows\System32\!FILENAME! not found.
		)
	)
)

ECHO.
ECHO DONE!

ENDLOCAL
EXIT /B

:NoExtensions
ECHO.
ECHO ERROR: No command extensions / delayed variable expansion available.
EXIT /B 1
