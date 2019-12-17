:: Create a bootable CD-ROM
ECHO "Current directory is: "%CD%
oscdimg -n -b%CD%\etfsboot.com %CD%\ISO %CD%\winpe_amd64.iso
