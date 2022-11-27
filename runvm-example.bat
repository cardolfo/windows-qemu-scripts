@echo off

set "QVMNAME=Ubuntu2210"
set "QVMDISKNAME=%QVMNAME%.qcow2"

set "MEMORY=8G"

rem ==================================
rem Run the virtual machine
rem ==================================
start "QEMU" qemu-system-x86_64.exe -accel whpx,kernel-irqchip=off -hda %QVMDISKNAME% -m %MEMORY% -net nic,model=virtio -net user -vga std -boot strict=on -smp 8,sockets=1,cores=8,threads=1


rem ==================================
rem Experiments
rem ==================================
rem -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp::2222-:22