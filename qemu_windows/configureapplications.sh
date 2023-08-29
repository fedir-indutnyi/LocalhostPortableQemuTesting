#!/bin/bash

echo 'Get  latest updates:'
sudo apt update

echo 'Install git:'
sudo apt install git -y

echo 'Also Docker might go here:'

sudo apt install mc

echo 'Install Sftp shared access to host windows'
cd ~
sudo apt install sshfs
mkdir shared

echo 'Install Brew - to be able to install Task'
cd ~
sudo apt update
sudo apt-get install build-essential
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/osboxes/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew doctor
echo 'Install Taskfile utility: (similar like ansible)'
brew install go-task
task --version


echo 'password' | sshfs tester@10.0.2.2:/ ./shared -p2222
