Q:
cd vmachine


@echo off

rem ==================================
rem Replace with your values
rem ==================================
set "QEMUDIR=Q:\qemu"

rem ==================================
rem You can add a w suffix to this if 
rem you don't want a console
rem ==================================
set "QEMUBIN=qemu-system-x86_64.exe"

rem ==================================
rem Run the virtual machine
rem ==================================

rem from example:
rem start "QEMU" %QEMUDIR%\%QEMUBIN% -drive file=hda.img,index=0,media=disk,format=raw -m 2G -L Bios -usbdevice mouse -usbdevice keyboard -boot menu=on -rtc base=localtime,clock=host -parallel none -serial none -name centos -no-acpi -no-hpet -no-reboot -device e1000,netdev=user.0 -netdev user,id=user.0,hostfwd=tcp::2222-:22

rem -cdrom B:\vmachine\ubuntu.iso  -usbdevice keyboard -vga cirrus -smb /usr/local/public -usbdevice tablet -vga qxl -vga vmware -vga std
rem -machine type=q35,accel=kvm  - Modern chipset (PCIe, AHCI, ...) and hardware virtualization acceleration
rem -net user,hostfwd=tcp::10022-:22  
rem -drive format=vvfat,file=fat:r:B:/,if=virtio
rem -net nic,model=virtio
rem -vga std 
rem -display sdl -vga none -device virtio-vga,xres=800,yres=600


rem correct
%QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 3592M  -hda Q:\vmachine\hdd.vmdk -display sdl -vga none -device virtio-vga,xres=800,yres=600 -boot c -usb -usbdevice keyboard   -net nic -net user,hostfwd=tcp::10022-:22  -parallel none -serial none -device usb-kbd -usbdevice tablet



pause