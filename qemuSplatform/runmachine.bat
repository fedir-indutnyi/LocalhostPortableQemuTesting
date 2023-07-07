rem map temporary b drive
subst q: .

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
rem -net user,smb=/absolute/path/to/folder -net nic,model=virtio 
rem -net user,smb="q:" -net nic,model=virtio
rem -net nic,model=virtio
rem -vga std 
rem -display sdl -vga none -device virtio-vga,xres=800,yres=600


rem correct
rem prev %QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 4G  -hda Q:\vmachine\hdd.vmdk -display sdl -vga none -device virtio-vga,xres=800,yres=600 -boot c -usb -usbdevice keyboard  -net nic,model=rtl8139  -net user,hostfwd=tcp::10022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::18080-:8080,hostfwd=tcp::3000-:3000 -parallel none -serial none -device usb-kbd -usbdevice tablet 
rem %QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 4G  -hda "Q:\vmachine\Ubuntu 20.04.4 (64bit).vmdk" -display sdl -vga none -device virtio-vga,xres=800,yres=600 -boot c -usb -usbdevice keyboard         -netdev user,id=mynet0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::18080-:8080,hostfwd=tcp::3000-:3000 -device e1000,netdev=mynet0        -parallel none -serial none -device usb-kbd -usbdevice tablet 
rem %QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 4G  -hda "Q:\vmachine\Ubuntu 20.04.4 (64bit).vmdk" -display sdl -vga none -device virtio-vga,xres=800,yres=600 -boot c -usb -usbdevice keyboard         -netdev user,id=mynet0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::18080-:8080,hostfwd=tcp::18001-:8001,hostfwd=tcp::3000-:3000 -device e1000,netdev=mynet0      -netdev user,id=n0,smb="q:"    -parallel none -serial none -device usb-kbd -usbdevice tablet 
rem %QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 4G  -hda "Q:\vmachine\Ubuntu 20.04.4 (64bit).vmdk" -display sdl -vga none -device virtio-vga,xres=800,yres=600 -boot c -usb -usbdevice keyboard         -netdev user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18001-:8001 -device e1000,netdev=user0     -parallel none -serial none -device usb-kbd -usbdevice tablet 
rem %QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 4G  -hda "Q:\vmachine\Ubuntu 20.04.4 (64bit).vmdk" -display sdl -vga none -device virtio-vga,xres=800,yres=600 -boot c -usb -usbdevice keyboard        -net nic -net user,id=user0,,hostfwd=tcp::8080-:80,hostfwd=tcp::8001-:8001,hostfwd=tcp::10022-:22  -parallel none -serial none -device usb-kbd -usbdevice tablet 

%QEMUDIR%\%QEMUBIN% -L %QEMUDIR% -m 4G -smp cores=2,threads=1,sockets=1 -hda "Q:\vmachine\Lubuntu 20.04.4 (64bit).vmdk" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot c -usb -usbdevice keyboard        -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080  -parallel none -serial none -device usb-kbd -usbdevice tablet 

rem qemu-img convert -O vmdk Q:\vmachine\mybackup.img vmdkname.vmdk 


pause