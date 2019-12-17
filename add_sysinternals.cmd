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

IF EXIST %SysinternalsDir%\Eula.txt (
	GOTO CopyTools
) ELSE (
	ECHO Error: %SysinternalsDir% not found.
	ECHO TOOLS NOT COPIED
	ECHO /B 2
)

:CopyTools
FOR /F %%X IN ('DIR /B/D %SysinternalsDir%\*.exe') DO (
	SET FILENAME=%SysinternalsDir%\%%X
	IF EXIST !FILENAME! (
		ECHO !FILENAME! exists.
	) ELSE (
		COPY /VY !FILENAME! %CD%\mount\Windows\System32>nul
		ECHO !FILENAME! copied.
	)
)

:MakeHardlinks
FOR /F %%X IN ('DIR /B/D %SysinternalsDir%\*.exe') DO (
	SET FILENAME=%%X
	FOR /F "tokens=1,2 delims=64" %%A IN ("!FILENAME!") DO (
		SET BEFORE_UNDERSCORE=%%A
		SET AFTER_UNDERSCORE=%%B
		IF EXIST %CD%\mount\Windows\System32\%%A%%B (
			ECHO %CD%\mount\Windows\System32\%%A%%B already linked.
		) ELSE (
			MKLINK /H %CD%\mount\Windows\System32\%%A%%B %CD%\mount\Windows\System32\!FILENAME!>nul
			ECHO %CD%\mount\Windows\System32\!FILENAME! linked.
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
