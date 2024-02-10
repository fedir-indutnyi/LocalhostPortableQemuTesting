# qemuwithdockerWindowsTesting
This is set of configured tools to perform automatic portable docker testing on Windows Computer

Tested on Windows 10 x64.
login osboxes
pass osboxes.org

Initial set of commands to patch OsBoxes Image to be able to support more flexible operations:
If you need Internet and not configured proxy, first create a file configureproxy.sh and run it manually
or copy install scripts:

Manually run commands from configure proxy and applications.

q:\tools\PuTTYPortable\App\putty\pscp.exe -C -agent -P 10022 -pw oxboxes.org 'q:\qemu_windows\configureproxy.sh' osboxes@127.0.0.1:~ 
q:\tools\PuTTYPortable\App\putty\pscp.exe -C -agent -P 10022 -pw oxboxes.org 'q:\qemu_windows\configureapplications.sh' osboxes@127.0.0.1:~ 

To enable SSH Access:
sudo apt-get update
sudo apt-get upgrade
sudo apt install openssh-server
sudo systemctl status ssh
sudo ufw allow ssh


install docker:
https://docs.docker.com/engine/install/ubuntu/
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
https://docs.docker.com/engine/install/linux-postinstall/
 sudo systemctl enable docker.service
 sudo systemctl enable containerd.service


Accessing virtual machine from Windows:

``` sh
ssh osboxes@127.0.0.1 -p10022
sudo apt install sshfs
sudo apt install mc
```

if this happens:
The authenticity of host '[127.0.0.1]:10022 ([127.0.0.1]:10022)' can't be established.
then delete c:\users\cuurent user\.shh

Creating a tunnel (example of most used ports):
``` sh
ssh -L 34200:127.0.0.1:34200 -L 33000:127.0.0.1:33000 -L 41060:127.0.0.1:41060 -L 41061:127.0.0.1:41061 -L 41062:127.0.0.1:41062 -L 41063:127.0.0.1:41063 -L 8334:127.0.0.1:8334 -L 3306:127.0.0.1:3306 -L 22:127.0.0.1:22 -L 80:127.0.0.1:80 -L 31191:127.0.0.1:31191 -L 30604:127.0.0.1:30604  -L 8001:127.0.0.1:8001 -L 27017:127.0.0.1:27017 -L 8081:127.0.0.1:8080 -L 6443:127.0.0.1:6443 -L 3000:127.0.0.1:3000 -L 4200:127.0.0.1:4200 -L 8443:192.168.67.2:8443  osboxes@127.0.0.1 -p10022 
```

``` sh
echo 'Disable GUI:'
sudo systemctl get-default
echo 'graphical.target'
sudo systemctl set-default multi-user
sudo reboot

chmod +x configureproxy.sh
sudo /bin/bash -c "./configureproxy.sh" 
or if doesnt work:
sudo ./configureproxy.sh

curl google.de
sudo reboot

chmod +x configureapplications.sh
sudo /bin/bash -c "./configureapplications.sh"


echo 'Connect Sftp shared access to host windows'
echo 'password' | sshfs tester@10.0.2.2:/ ./shared -p2222


sudo reboot
```

Get Docker images:
docker image ls
sudo k3s ctr images ls

If Docker has proxy internet "misbehaving" issue:
This is option for computer connected to internet via proxy, including docker setup:



sudo unlink /etc/resolv.conf
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
ls -l /etc/resolv.conf

lrwxrwxrwx 1 root root 32 May 29 08:48 /etc/resolv.conf -> /run/systemd/resolve/resolv.conf

$ sudo reboot




1. Create a drop-in
sudo mkdir /etc/systemd/system/docker.service.d
2. Create a file with name /etc/systemd/system/docker.service.d/http-proxy.conf that adds the HTTP_PROXY environment variable:
cd /etc/systemd/system/docker.service.d
sudo nano  http-proxy.conf
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

For saving Images:
docker save --output <filename>.tar imagetosave:latest


Accessing virtual machine from Windows:

``` sh
ssh osboxes@127.0.0.1 -p10022
sudo apt install mc
```

Creating a tunnel (example of most used ports):
``` sh
ssh -L 34200:127.0.0.1:34200 -L 33000:127.0.0.1:33000 -L 41060:127.0.0.1:41060 -L 41061:127.0.0.1:41061 -L 41062:127.0.0.1:41062 -L 41063:127.0.0.1:41063 -L 8334:127.0.0.1:8334 -L 3306:127.0.0.1:3306 -L 22:127.0.0.1:22 -L 80:127.0.0.1:80 -L 31191:127.0.0.1:31191 -L 30604:127.0.0.1:30604  -L 8001:127.0.0.1:8001 -L 27017:127.0.0.1:27017 -L 8080:127.0.0.1:8080 -L 6443:127.0.0.1:6443 -L 3000:127.0.0.1:3000 -L 4200:127.0.0.1:4200 -L 8443:192.168.67.2:8443  osboxes@127.0.0.1 -p10022 


ssh -L 34200:localhost:34200 -L 33000:localhost:33000 -L 41060:localhost:41060 -L 41061:localhost:41061 -L 41062:localhost:41062 -L 41063:localhost:41063 -L 8334:localhost:8334 -L 3306:localhost:3306 -L 22:localhost:22 -L 8080:localhost:8080 -L 31191:localhost:31191 -L 30604:localhost:30604  -L 8001:localhost:8001 -L 27017:localhost:27017 -L 80:localhost:80 -L 6443:localhost:6443 -L 3000:localhost:3000 -L 4200:localhost:4200 -L 8443:localhost.2:8443 -L 9000:localhost.2:9000  osboxes@localhost -p10022 
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

copy to home
chmod +x install_autok3s.sh
sudo sh install_autok3s.sh
