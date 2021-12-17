#!/usr/bin/env bash

set -e
set -x

# Deploy configuration file
sudo cp /tmp/warewulf.conf /etc/warewulf/warewulf.conf

# Configure system services
sudo wwctl configure dhcp
sudo wwctl configure tftp
sudo wwctl configure nfs
sudo wwctl configure ssh

# Start the warewulfd.service
sudo systemctl enable --now warewulfd.service
sudo wwctl server status

# Pull and build the VNFS container and kernel
sudo wwctl container import docker://warewulf/centos-8 centos8 --setdefault
sudo wwctl kernel import "$(uname -r)" --setdefault

# Setup the default node profile
sudo wwctl profile set --yes default --netdev enp0s8 -M 255.255.255.0 -G 192.168.15.15

sudo wwctl profile list --verbose

# Add node(s) and build node specific overlays
sudo wwctl node add cn0 --netdev enp0s8 -I 192.168.15.130 --hwaddr "08:00:27:54:8a:84" --type Ethernet
sudo wwctl node set --yes --netdev enp0s8 --netdefault cn0
sudo wwctl node set --yes --discoverable cn0

sudo wwctl node add cn1 --netdev enp0s8 -I 192.168.15.131 --hwaddr "08:00:27:db:86:d5" --type Ethernet
sudo wwctl node set --yes --netdev enp0s8 --netdefault cn1
sudo wwctl node set --yes --discoverable cn1

sudo wwctl node list --long
sudo wwctl node list --net

# Update the cluster /etc/hosts file
sudo wwctl configure hosts

# Make sure all hosts are in DHCP
sudo wwctl configure dhcp

# Add / Modify runtime overlays
sudo wwctl overlay import runtime default /etc/shadow /etc/shadow.ww
sudo wwctl overlay mkdir  runtime --mode 640 default /etc/sudoers.d
sudo wwctl overlay import runtime --mode 440 default /etc/sudoers.d/vagrant

# (Re)build all overlays
sudo wwctl overlay build -a
