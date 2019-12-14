rem map temporary b drive
subst q: .\qemuSplatform

rem navigate to qemu drive 
q:

rem delete existing hard drive image if exists

rem copy new hard drive from archive
"q:\vmachine\7-Zip\7z.exe" e -ir!CentOs7.vmdk "q:\vmachine\1. backup clean docker installed\CentOS7.7z.001" -o"q:\vmachine"
ren "q:\vmachine\CentOs7.vmdk" "hdd.vmdk"

rem run virtual machine
start runmachine.bat

rem wait 10 minutes, which potentially enough on most computers to go online
timeout 600

rem connect with putty and execute list of commands
q:\PuTTYPortable\App\putty\plink.exe -ssh osboxes@127.0.0.1 -P 10022 -pw oxboxes.org -m q:\puttycommands.txt

rem connect with putty and run container

rem make pause so user can check if application works

rem ask to delete hard disk image

rem un-map temporary b drive

rem
pause