rem navigate to qemu drive 
q:

rem delete existing hard drive image if exists

rem copy new hard drive from archive
"q:\vmachine\7-Zip\7z.exe" e -ir!CentOs7.vmdk "q:\vmachine\1. backup clean docker installed\CentOS7.7z.001" -o"q:\vmachine"
ren "q:\vmachine\CentOs7.vmdk" "hdd.vmdk"
