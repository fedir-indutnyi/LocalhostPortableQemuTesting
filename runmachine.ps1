# ==================================
# Replace with your values
# ==================================
$QEMUDIR = "qemu_windows\qemu"
# $QEMUHDD = "qemu_windows\vmachine\Ubuntu-minimal-server-22.vmdk"
$QEMUHDD = "C:\temp\noble-server-cloudimg-amd64.img"
# $QEMUHDD = "C:\temp\ubuntu-24.04-minimal-cloudimg-amd64.img"
$SEEDIMG = "C:\Users\Fedir\Google Drive\projects2\QemuVirtualTestingCleanRepoGithub\gitsourceQemuTesting\qemu_windows\seed\seed6.img"

# ==================================
# You can add a w suffix to this if 
# you don't want a console
# ==================================
$QEMUBIN = "qemu-system-x86_64.exe"

# Convert relative paths to absolute paths
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$QEMUDIR = Join-Path $scriptDir $QEMUDIR

# Check if QEMUHDD is an absolute path
if ($QEMUHDD -notmatch ":") {
    $QEMUHDD = Join-Path $scriptDir $QEMUHDD
}

# ==================================
# Run the virtual machine
# ==================================

Write-Output "QEMUDIR=$QEMUDIR"
Write-Output "QEMUHDD=$QEMUHDD"
Write-Output "$QEMUDIR\$QEMUBIN"

# Uncomment the desired command to run the virtual machine
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -hda "$QEMUHDD" -cdrom "C:\temp\k3os-amd64.iso" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot cdrom -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080 -parallel none -serial none -device usb-kbd -usbdevice tablet
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -hda "$QEMUHDD" -cdrom "C:\temp\k3os-amd64.iso" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot cd -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080 -parallel none -serial none -device usb-kbd -usbdevice tablet
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -hda "$QEMUHDD" -drive if=virtio,format=raw,file="C:\workdata\repocode\personal-learning\QEMU VirtualMachines\LocalhostPortableQemuTestingCleanRepo\qemu_windows\seed.img" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot c -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080 -parallel none -serial none -device usb-kbd -usbdevice tablet
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -hda "$QEMUHDD" -cdrom "C:\temp\ubuntu-22.04.3-live-server-amd64.iso" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot c -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080 -parallel none -serial none -device usb-kbd -usbdevice tablet
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -hda "$QEMUHDD" -drive if=virtio,format=raw,file="C:\workdata\repocode\personal-learning\QEMU VirtualMachines\LocalhostPortableQemuTestingCleanRepo\qemu_windows\seed\seed1.img" -parallel none -serial none -device usb-kbd -usbdevice tablet
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -hda "$QEMUHDD" -fda "file:C:\workdata\repocode\personal-learning\QEMU VirtualMachines\LocalhostPortableQemuTestingCleanRepo\qemu_windows\seed\seed2.img" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot c -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080 -parallel none -serial none -device usb-kbd -usbdevice tablet
# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=2,sockets=2 -hda "$QEMUHDD" -drive if=virtio,format=raw,file="file:C:\Users\Fedir\Google Drive\projects2\QemuVirtualTestingCleanRepoGithub\gitsourceQemuTesting\qemu_windows\seed\seed3.img" -display sdl -vga none -device virtio-vga,xres=640,yres=480 -boot c -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,hostfwd=tcp::18080-:18080 -parallel none -serial none -device usb-kbd -usbdevice tablet -net user,id=user1,smb="C:\temp"

& "$QEMUDIR\$QEMUBIN" `
-L "$QEMUDIR" `
-m 4G `
-smp cores=2,threads=1,sockets=1 `
-cdrom "C:\Users\Fedir\Desktop\Alkid Live Cd\alkid.live.cd\alkid.live.dvd.full\Alkid.Live.DVD.iso" `
-hda "$QEMUHDD" `
-drive if=virtio,format=raw,file="file:$SEEDIMG" `
-boot order=cd,once=c,menu=on `
-display sdl `
-vga none `
-device virtio-vga,xres=640,yres=480 `
-usb `
-usbdevice keyboard `
-net nic `
-net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,smb="C:\temp" `
-parallel none `
-serial none


# & "$QEMUDIR\$QEMUBIN" -L "$QEMUDIR" -m 4G -smp cores=2,threads=1,sockets=1 -cdrom "D:\clonezilla-live-20240408-noble-amd64.iso" -hda "$QEMUHDD" -drive if=virtio,format=raw,file="file:$SEEDIMG" -boot order=cd,once=d,menu=on -display sdl -vga none -device virtio-vga,xres=640,yres=480 -usb -usbdevice keyboard -net nic -net user,id=user0,hostfwd=tcp::8080-:80,hostfwd=tcp::10022-:22,smb="C:\temp" -parallel none -serial none

# -nographic
# qemu-img convert -O vmdk Q:\vmachine\mybackup.img vmdkname.vmdk

Pause
