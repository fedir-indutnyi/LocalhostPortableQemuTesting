# qemuwithdockerWindowsTesting
This is set of configured tools to perform automatic portable docker testing on Windows Computer

Tested on Windows 10 x64.
login osboxes
pass osboxes.org

Initial set of commands to patch OsBoxes Image to be able to support more flexible operations:

``` sh
echo 'Setup permanent Proxy (if needed):'
sudo cat /etc/environment
sudo bash -c 'grep -q FTP_PROXY /etc/environment || echo 'FTP_PROXY="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q HTTPS_PROXY /etc/environment || echo 'HTTPS_PROXY="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q HTTP_PROXY /etc/environment || echo 'HTTP_PROXY="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q NO_PROXY /etc/environment || echo 'NO_PROXY="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q ftp_proxy /etc/environment || echo 'ftp_proxy="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q http_proxy /etc/environment || echo 'http_proxy="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q https_proxy /etc/environment || echo 'https_proxy="http://10.0.2.2:3128/"' >> /etc/environment'
sudo bash -c 'grep -q no_proxy /etc/environment || echo 'no_proxy="localhost,127.0.0.0/8,::1"' >> /etc/environment'
sudo cat /etc/systemd/system.conf
sudo bash -c 'sed -i -e 's/#DefaultEnvironment=//g' /etc/systemd/system.conf'
export DefaultEnvironment='"FTP_PROXY=http://10.0.2.2:3128/" "HTTPS_PROXY=http://10.0.2.2:3128/" "HTTP_PROXY=http://10.0.2.2:3128/" "NO_PROXY=localhost,127.0.0.0/8,::1" "ftp_proxy=http://10.0.2.2:3128/" "http_proxy=http://10.0.2.2:3128/" "https_proxy=http://10.0.2.2:3128/" "no_proxy=localhost,127.0.0.0/8,::1"'
echo "DefaultEnvironment=$DefaultEnvironment" | sudo tee -a /etc/systemd/system.conf

echo 'Get  latest updates:'
sudo apt update

echo 'Disable GUI:'
sudo systemctl set-default multi-user

echo 'Install git:'
sudo apt install git -y

echo 'Install Taskfile utility: (similar like ansible)'
cd ~
sudo apt update
sudo apt-get install build-essential
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew doctor
brew install go-task
task --version

echo 'Install Sftp shared access to host windows'
cd ~
sudo apt install sshfs
mkdir shared
echo 'password' | sshfs tester@10.0.2.2:/ ./shared -p2222





sudo reboot
```



Accessing virtual machine from Windows:
ssh osboxes@127.0.0.1 -p10022

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


