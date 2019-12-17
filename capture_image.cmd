:: Connect to Windows Deployment Images network share
REM NET USE Y: \\DEBRA-PC\images /USER:DEBRA-PC\Administrator Robert12
NET USE Y: \\DEBRA-PC\images /USER:DEBRA-PC\m0du1us Robert12
IMAGEX /COMPRESS FAST /CHECK /SCROLL /CAPTURE C: Y:\windows7\System.wim "Windows Enterprise" "System Partition"
IMAGEX /CHECK /COMPRESS fast /SCROLL /VERIFY /CAPTURE D: Y:\windows7\windows7.wim "Windows Enterprise VM" "
EXIT /B
