#!/usr/bin/env bash

# Install Warewulf dependencies
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install epel-release
sudo dnf -y install golang tftp-server dhcp-server nfs-utils

# Download build and install Warewulf
git clone https://github.com/hpcng/warewulf.git
cd ./warewulf || exit
make all
sudo make install
