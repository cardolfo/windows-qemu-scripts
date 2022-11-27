@echo off
rem ==================================
rem Replace with your values
rem ==================================
set "QVMSDIR=c:\qemu\vms"
set "QVMNAME=Ubuntu2210"
set "QVMDIRVM=%QVMSDIR%\%QVMNAME%"
set "QVMDISKNAME=%QVMDIRVM%\%QVMNAME%.qcow2"

set "ISOFILE=C:\Users\cardo\Downloads\ubuntu-22.10-desktop-amd64.iso"
set "MEMORY=8G"

rem ==================================
rem You can add a w suffix to this if 
rem you don't want a console
rem ==================================
set "QEMUBIN=qemu-system-x86_64.exe"
 
rem ==================================
rem Run the virtual machine
rem ==================================
start "QEMU" qemu-system-x86_64.exe -accel whpx,kernel-irqchip=off -hda %QVMDISKNAME% -m %MEMORY% -net nic,model=virtio -net user -cdrom %ISOFILE% -vga std -boot strict=on -smp 8,sockets=1,cores=8,threads=1

rem -accel whpx
rem -smp 8,sockets=2,cores=2,threads=2,maxcpus=8 -cpu host

rem -L Bios -usbdevice mouse -usbdevice keyboard -boot menu=on -rtc base=localtime,clock=host -parallel none -serial none -name %QVMNAME% -no-acpi -no-hpet -no-reboot 