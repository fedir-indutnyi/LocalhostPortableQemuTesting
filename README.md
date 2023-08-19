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


If Docker has proxy internet "misbehaving" issue:
This is option for computer connected to internet via proxy, including docker setup:



$ sudo unlink /etc/resolv.conf
$ sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
$ ls -l /etc/resolv.conf

lrwxrwxrwx 1 root root 32 May 29 08:48 /etc/resolv.conf -> /run/systemd/resolve/resolv.conf

$ sudo reboot




1. Create a drop-in
mkdir /etc/systemd/system/docker.service.d
2. Create a file with name /etc/systemd/system/docker.service.d/http-proxy.conf that adds the HTTP_PROXY environment variable:
cd /etc/systemd/system/docker.service.d
nano  http-proxy.conf
cat http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://10.0.2.2:3128/"
Environment="HTTPS_PROXY=http://10.0.2.2:3128/"
Environment="NO_PROXY="localhost,127.0.0.1,::1"


3. reload the systemd daemon
systemctl daemon-reload
4. restart docker
systemctl restart docker
5. Verify that the configuration has been loaded:
systemctl show docker --property Environment




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
1. Lubuntu preinstalled image from osboxes.org (zipped) with ssh access enabled
2. Windows compiled QEMU
3. Putty


This Kit contains no sofware that cannot be used for free.
All usage at your own risk



