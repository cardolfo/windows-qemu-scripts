@echo off
rem ==================================
rem Replace with your values
rem ==================================
set "QVMSDIR=C:\qemu\vms"
set "QVMNAME=Ubuntu2210"
set "QVMDIRVM=%QVMSDIR%\%QVMNAME%"
set "QVMDISKLENTGH=40G"
set "QVMDISKNAME=%QVMDIRVM%\%QVMNAME%.qcow2"

rem ==================================
rem Safety net
rem ==================================
if not exist %QVMDISKNAME% (
    rem CREATE a virtual hard disk 
    mkdir %QVMDIRVM%
    qemu-img.exe create -f qcow2 %QVMDISKNAME% %QVMDISKLENTGH%
) else (
    echo file %QVMDISKNAME% already exist. Delete or move and try again.
    goto:eof
)