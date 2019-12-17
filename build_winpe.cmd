@ECHO OFF

SET ARCH=x86

:: Setup build env
ECHO.
ECHO Setup build environment
ECHO ===========================================================================
CALL .\setup_build_env.cmd
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF
IF ERRORLEVEL 3 GOTO:EOF

:: Mount boot.wim
ECHO.
ECHO Mount boot.wim
ECHO ===========================================================================
CALL .\mount_boot_wim.cmd
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF
IF ERRORLEVEL 3 GOTO:EOF

:: Copy tools
ECHO.
ECHO Copy tools
ECHO ===========================================================================
ECHO Add ImageX
CALL .\add_imagex.cmd %ARCH%
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF
IF ERRORLEVEL 3 GOTO:EOF
ECHO Add GImageX
CALL .\add_gimagex.cmd %ARCH%
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF
IF ERRORLEVEL 3 GOTO:EOF
ECHO Add Sysinternals
CALL .\add_sysinternals.cmd %ARCH%
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF
IF ERRORLEVEL 3 GOTO:EOF
ECHO Set EulaAccepted
CALL .\Sysinternals_EulaAccepted.cmd
IF ERRORLEVEL 1 GOTO:EOF

:: Unmount boot.wim
ECHO.
ECHO Unmount boot.wim
ECHO ===========================================================================
CALL .\unmount_boot_wim.cmd
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF

:: Create ISO
ECHO.
ECHO Create winpe_%ARCH%.iso
ECHO ===========================================================================
CALL .\create_boot_iso.cmd %ARCH%
IF ERRORLEVEL 1 GOTO:EOF
IF ERRORLEVEL 2 GOTO:EOF
