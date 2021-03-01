#!/usr/bin/env bash

set -e
set -x

# Deploy configuration file
sudo cp /tmp/warewulf.conf /etc/warewulf/warewulf.conf

# Configure system services
sudo wwctl configure dhcp --persist
sudo wwctl configure tftp --persist
sudo wwctl configure nfs  --persist
sudo wwctl configure ssh  --persist

# Pull and build the VNFS container and kernel
sudo wwctl container import docker://warewulf/centos-8 centos8 --setdefault
sudo wwctl kernel import "$(uname -r)" --setdefault

# Setup the default node profile
#sudo wwctl profile set default -K $(uname -r) -C centos-8
sudo wwctl profile set --force default --netdev eth1 -M 255.255.255.0 -G 10.0.2.1
sudo wwctl profile set --force default --netdev eth0 -M 255.255.255.0 -G 192.168.15.15
sudo wwctl profile set --force default --netdev enp0s3 -M 255.255.255.0 -G 10.0.2.1
sudo wwctl profile set --force default --netdev enp0s8 -M 255.255.255.0 -G 192.168.15.15
sudo wwctl profile list

# Add node(s) and build node specific overlays
sudo wwctl node add cn0.cluster --netdev enp0s8 -I 192.168.15.130 --hwaddr "08:00:27:54:8a:84" --discoverable
sudo wwctl node set --netdev enp0s3 -I 10.0.2.130 --hwaddr "08:00:27:F4:4F:4C" cn0
sudo wwctl node set --netdev enp0s8 --netdefault cn0

sudo wwctl node add cn1.cluster --netdev enp0s8 -I 192.168.15.131 --hwaddr "08:00:27:db:86:d5" --discoverable
sudo wwctl node set --netdev enp0s3 --hwaddr "08:00:27:45:b9:e5" cn1
sudo wwctl node set --netdev enp0s8 --netdefault cn1

sudo wwctl node list

# Add shadow file runtime overlay
sudo wwctl overlay import default /etc/shadow /etc/shadow.ww

# (Re)build all overlays
sudo wwctl overlay build -a

# Start warewulf daemons
sudo wwctl ready
sudo wwctl server start
sudo wwctl server status
