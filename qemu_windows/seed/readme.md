cloud-localds seed.img user-data.yaml metadata.yaml


To enable SSH password authentication, you must SSH in as root to edit this file:

/etc/ssh/sshd_config
Then, change the line

PasswordAuthentication no
to

PasswordAuthentication yes

And change the line

PermitRootLogin no
to

PermitRootLogin yes

sudo service ssh restart
If you enable this setting, don't forget to set a strong password for root by running the command.
sudo passwd root