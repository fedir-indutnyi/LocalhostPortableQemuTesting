
@echo off

rem ==================================
rem Replace with your values
rem ==================================
set "QEMUDIR=qemu_windows\qemu"
set "QEMUHDD=qemu_windows\vmachine\Ubuntu-minimal-server-22.vmdk"
rem ==================================
rem You can add a w suffix to this if 
rem you don't want a console
rem ==================================
set "QEMUBIN=qemu-system-x86_64.exe"



rem Convert relative paths to absolute paths
cd %~dp0
set "QEMUDIR=%CD%\%QEMUDIR%"


rem Check if QEMUHDD is an absolute path
echo %QEMUHDD% | findstr ":" >nul && (
    rem QEMUHDD is an absolute path, don't modify it
) || (
    rem QEMUHDD is a relative path, concatenate with current directory
    set "QEMUHDD=%CD%\%QEMUHDD%"
)


rem ==================================
rem Run the virtual machine
rem ==================================


echo QEMUDIR=%QEMUDIR%
echo QEMUHDD=%QEMUHDD%
echo "%QEMUDIR%/%QEMUBIN%"
rem "%QEMUDIR%/%QEMUBIN%" -L "%QEMUDIR%" -m 4G -smp cores=2,threads=1,sockets=1 -hda "%QEMUHDD%" -cdrom "C:\temp\k3os-amd64.iso" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot cdrom -usb -usbdevice keyboard        -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080  -parallel none -serial none -device usb-kbd -usbdevice tablet 
rem "%QEMUDIR%/%QEMUBIN%" -L "%QEMUDIR%" -m 4G -smp cores=2,threads=1,sockets=1 -hda "%QEMUHDD%" -cdrom "C:\temp\k3os-amd64.iso" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot cd -usb -usbdevice keyboard        -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080  -parallel none -serial none -device usb-kbd -usbdevice tablet 
"%QEMUDIR%/%QEMUBIN%" -L "%QEMUDIR%" -m 4G -smp cores=2,threads=1,sockets=1 -hda "%QEMUHDD%" -cdrom "C:\temp\ubuntu-22.04.3-live-server-amd64.iso" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot c -usb -usbdevice keyboard        -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080  -parallel none -serial none -device usb-kbd -usbdevice tablet 

rem qemu-img convert -O vmdk Q:\vmachine\mybackup.img vmdkname.vmdk 

pause