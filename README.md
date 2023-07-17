# qemuwithdockerWindowsTesting
This is set of configured tools to perform automatic portable docker testing on Windows Computer

Tested on Windows 10 x64.
login osboxes
pass osboxes.org

Initial set of commands to patch OsBoxes Image to be able to support more flexible operations:
If you need Internet and not configured proxy, first create a file configureproxy.sh and run it manually
or copy install scripts:

q:\tools\PuTTYPortable\App\putty\pscp.exe -C -agent -P 10022 -pw oxboxes.org 'q:\qemu_windows\configureproxy.sh' osboxes@127.0.0.1:~ 
q:\tools\PuTTYPortable\App\putty\pscp.exe -C -agent -P 10022 -pw oxboxes.org 'q:\qemu_windows\configureapplications.sh' osboxes@127.0.0.1:~ 


``` sh

echo 'Disable GUI:'
sudo systemctl set-default multi-user

chmod +x configureproxy.sh
sudo ./configureproxy.sh
curl google.de
sudo reboot


chmod +x configureapplications.sh
sudo ./configureapplications.sh


echo 'Connect Sftp shared access to host windows'
echo 'password' | sshfs tester@10.0.2.2:/ ./shared -p2222


sudo reboot
```



Accessing virtual machine from Windows:

``` sh
ssh osboxes@127.0.0.1 -p10022
```

Creating a tunnel (example of most used ports):
``` sh
ssh -L 31191:127.0.0.1:31191 -L 30604:127.0.0.1:30604   -L 8001:127.0.0.1:8001  -L 27017:127.0.0.1:27017  -L 8081:127.0.0.1:8080  -L 6443:127.0.0.1:6443 -L 8443:192.168.67.2:8443 osboxes@127.0.0.1 -p10022 
```

After deployment:
http://127.0.0.1:8080/ (inside qemu)
http://127.0.0.1:80/ (inside windows)

It has following Free Components:
1. CentOS7 preinstalled image from osboxes.org (zipped)
2. Free Windows compiled QEMU
3. Free 7zip
4. Free Putty


This Kit contains no sofware that cannot be used for free.
All usage at your own risk
Video demonstartion is avaliable in root folder


