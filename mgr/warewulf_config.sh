#!/usr/bin/env bash

set -e
set -x

# Deploy configuration file
sudo cp /tmp/warewulf.conf /etc/warewulf/warewulf.conf

# Setup firewall
sudo systemctl restart firewalld
sudo firewall-cmd --permanent --add-service warewulf
sudo firewall-cmd --permanent --add-service nfs
sudo firewall-cmd --permanent --add-service tftp
sudo firewall-cmd --reload

# Create the group the warewulfd service will run as
sudo groupadd -r warewulf

# Reload system services
sudo systemctl daemon-reload

# Start and enable the warewulfd service
sudo systemctl enable --now warewulfd
sudo wwctl server status

# Configure system services
sudo wwctl configure dhcp
sudo wwctl configure tftp
sudo wwctl configure nfs
sudo wwctl configure ssh

# Pull and build the VNFS container and kernel
sudo wwctl container import docker://warewulf/rocky:8 rocky-8 --setdefault
sudo wwctl kernel import "$(uname -r)" --setdefault

# Setup the default node profile
sudo wwctl profile set --yes default --kernel $(uname -r) --container rocky-8

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
sudo wwctl overlay mkdir runtime --mode 640 default /etc/sudoers.d
sudo wwctl overlay import runtime --mode 440 default /etc/sudoers.d/vagrant
sudo wwctl overlay list runtime -la

# (Re)build all overlays
sudo wwctl overlay build runtime default
sudo wwctl overlay build system default

# re-Start warewulf daemons
sudo wwctl node ready
sudo wwctl server restart
sudo wwctl server status
