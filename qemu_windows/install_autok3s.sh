#!/bin/bash


# Define environment variables
export KUBE_EXPLORER_VERSION=v0.4.0
export HELM_DASHBOARD_VERSION=1.3.3
# Define environment variables
export LINUX_USERNAME="osboxes"
export NODE_NAME="localhost"
export LOCALHOST_IP="127.0.0.1"

# Install required packages
apt-get update && \
apt-get install -y curl ca-certificates tar gzip && \
rm -rf /var/lib/apt/lists/*

# Install autok3s
curl -sS https://rancher-mirror.rancher.cn/autok3s/install.sh | sh

# Start autok3s daemon
autok3s --help
# This is not needed as autok3s will be started 
# autok3s -d serve --bind-address=0.0.0.0

# Install SSH Server
apt-get update && \
apt-get install -y openssh-client openssh-server && \
dpkg-reconfigure openssh-server

# Start SSH service
service ssh start && sleep 5 && service ssh status


        echo "======== Generating local certificate =================="
        # This will not work because it asks prompt
        # ssh-keygen
        # But this will  work because it doesn't ask prompt
        # simplified without removal of existing keys:
        # sudo -u $LINUX_USERNAME ssh-keygen -t rsa -N '' <<<''
        echo "======== Install certificate (please type yes and hit ENTER) =================="
        chmod 700 ~/.ssh
        # improved with removal of existing keys:
        # -q means quit 
        # ssh-keygen -t rsa -b 4096 -N "" -q -f ~/.ssh/id_rsa
        echo -e 'yes\n' | sudo -u $LINUX_USERNAME sh -c 'rm -f ~/.ssh/id_rsa; ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa' 
        echo -e 'yes\n' | ssh-copy-id $LINUX_USERNAME@$LOCALHOST_IP
        # echo -e 'yes\n' | ssh-copy-id -i ~/.ssh/id_rsa.pub user@server
        ls -l ~/.ssh/id*

        # echo -e 'yes\n' | sudo -u $LINUX_USERNAME sh -c 'rm -f ~/.ssh/id_rsa; ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa' <<<''
        # echo -e 'yes\n' | ssh-copy-id $LINUX_USERNAME@$LOCALHOST_IP


# Configure shell
mkdir -p /home/shell
# echo '. /etc/profile.d/bash_completion.sh' >> /home/shell/.bashrc 
# echo 'alias k="kubectl"' >> /home/shell/.bashrc && \
# echo 'source <(kubectl completion bash)' >> /home/shell/.bashrc && \
# echo 'PS1="> "' >> /home/shell/.bashrc

# Install kube-explorer
curl -sSL https://github.com/cnrancher/kube-explorer/releases/download/${KUBE_EXPLORER_VERSION}/kube-explorer-${OS}-${ARCH} > /usr/local/bin/kube-explorer && \
chmod +x /usr/local/bin/kube-explorer

# Install helm-dashboard
curl -sLf https://github.com/komodorio/helm-dashboard/releases/download/v${HELM_DASHBOARD_VERSION}/helm-dashboard_${HELM_DASHBOARD_VERSION}_Linux_x86_64.tar.gz | tar xvzf - -C /usr/local/bin && \
chmod +x /usr/local/bin/helm-dashboard

# Set environment variables
export AUTOK3S_CONFIG=/root/.autok3s
export DOCKER_HOST=unix:///var/run/docker.sock
export HOME=/root
export AUTOK3S_HELM_DASHBOARD_ADDRESS=0.0.0.0

# Change working directory
# cd /home/shell

# Link autok3s to kubectl
ln -sf autok3s /usr/local/bin/kubectl

# run autok3s
echo "n" | autok3s
autok3s --help

# Expose port 8080
# iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

autok3s   create --provider  k3d --master  1 --name  naaadoker --worker  0 --k3s-install-script  https://get.k3s.io --api-port  0.0.0.0:0 --image  docker.io/rancher/k3s:v1.28.5-k3s1 --no-image-volume --no-lb