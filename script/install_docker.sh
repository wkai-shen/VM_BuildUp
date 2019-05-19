#!/usr/bin/env bash
set -e

SCRIPT_HOME="/vagrant/script"
start_time="$(date -u +%s)"
echo "============== Install Docker START at $(date) =============="

### SET UP THE REPOSITORY
sudo apt --assume-yes install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
### INSTALL DOCKER CE
sudo apt update  # To get the latest index
sudo apt --assume-yes install docker-ce docker-ce-cli containerd.io

### Solve Docker permission denied to connect to the docker daemon socket
### Add user = vagrant into docker group (can not use $USER because Vagrant executes the script by root)
### To verify - grep 'docker' /etc/group
sudo usermod -a -G docker vagrant

docker version

echo "============== Install Docker END at $(date) =============="
end_time="$(date -u +%s)"
timeElapsed="$(($end_time-$start_time))"

## Through Vagrant sync folder, we can call other bash script. By default, Vagrant will share the project directory (where is Vagrantfile located) to /vagrant.
## However bash script requires Unix line endings (LF) if the script is written in Windowns (CRLF)
## We can covert it by using Notepad++
## Soution Doc - https://stackoverflow.com/questions/16239551/eol-conversion-in-notepad
echo "The whole process took $(${SCRIPT_HOME}/utility/formatTimeFromSec.sh ${timeElapsed})"