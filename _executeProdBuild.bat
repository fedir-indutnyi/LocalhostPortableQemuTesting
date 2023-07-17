rem map temporary b drive
subst q: .\qemuSplatform

rem navigate to qemu drive 
q:

rem extract hdd
extractCleanHDD.bat 

rem run virtual machine
start runmachine.bat

rem wait 10 minutes, which potentially enough on most computers to go online
timeout 1600

rem connect with putty and execute list of commands
q:\PuTTYPortable\App\putty\plink.exe -ssh osboxes@127.0.0.1 -P 10022 -pw oxboxes.org -m q:\puttycommands.txt

rem connect with putty and run container

rem make pause so user can check if application works

rem ask to delete hard disk image

rem un-map temporary b drive

rem
pause