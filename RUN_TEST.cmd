SET WINPEDIR=C:\winpe_x86

@PUSHD %WINPEDIR%
CALL .\mount_boot_wim.cmd
@POPD
