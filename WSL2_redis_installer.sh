#!/bin/bash
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-5.0
sudo apt install -y daemonize dbus gawk libc6 libstdc++6 policykit-1 systemd systemd-container
sudo apt install apt-transport-https
sudo wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg
sudo chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg
sudo cat << EOF > /etc/apt/sources.list.d/wsl-transdebian.list
deb https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main
EOF
sudo apt update
sudo apt install -y systemd-genie
genie -s
sudo e2label /dev/sdb cloudimg-rootfs
sudo systemctl disable multipathd.socket
sudo apt install redis-server
sudo systemctl restart redis.service
sudo systemctl status redis
echo "redis installed on your machine's WSL2 system"