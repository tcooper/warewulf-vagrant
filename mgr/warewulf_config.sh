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
getent group warewulf >/dev/null || sudo groupadd -r warewulf

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

# Start the warewulfd.service
sudo systemctl enable --now warewulfd.service
sudo wwctl server status

# Pull and build the VNFS container and kernel
sudo wwctl container import docker://warewulf/rocky:8 rocky-8 --setdefault
sudo wwctl kernel import "$(uname -r)" --setdefault

# Setup the default node profile
sudo wwctl profile set --yes default --kernel "$(uname -r)" --container rocky-8

sudo wwctl profile list --verbose

# Add node(s) and build node specific overlays
sudo wwctl node add cn0 --netdev enp0s8 -I 192.168.15.130 --hwaddr "08:00:27:54:8a:84" --type Ethernet
sudo wwctl node set --yes --netdev enp0s8 --netdefault cn0
sudo wwctl node set --yes --netdev enp0s8 --netmask 255.255.255.0 cn0
sudo wwctl node set --yes --netdev enp0s8 --gateway 192.168.15.15 cn0
sudo wwctl node set --yes --discoverable cn0

# Add the NAT interface (for Vagrant backend)
sudo wwctl node set --yes --netdev enp0s3 --hwaddr "08:00:27:54:8a:82" cn0

sudo wwctl node add cn1 --netdev enp0s8 -I 192.168.15.131 --hwaddr "08:00:27:db:86:d5" --type Ethernet
sudo wwctl node set --yes --netdev enp0s8 --netdefault cn1
sudo wwctl node set --yes --netdev enp0s8 --netmask 255.255.255.0 cn1
sudo wwctl node set --yes --netdev enp0s8 --gateway 192.168.15.15 cn1
sudo wwctl node set --yes --discoverable cn1

# Add the NAT interface (for Vagrant backend)
sudo wwctl node set --yes --netdev enp0s3 --hwaddr "08:00:27:db:86:d3" cn1

sudo wwctl node list --long
sudo wwctl node list --net

# Update the cluster /etc/hosts file
sudo wwctl configure hosts

# Make sure all hosts are in DHCP
sudo wwctl configure dhcp

# Modify system overlay (we don't use eth0 so remove it from the default system overlay)
sudo wwctl overlay delete system default /etc/wicked/ifconfig/ifcfg-eth0.xml.ww
sudo wwctl overlay delete system default /etc/sysconfig/network-scripts/ifcfg-eth0.ww
sudo wwctl overlay delete system default /etc/network/interfaces.d/eth0.ww

# Import the enp0s8 templates into the system overlay
# A Vagrant quirk of the file provisioner is that the UID/GID are vagrant:vagrant
# These files should be UID:GID root:root, so change them explicitly.
sudo wwctl overlay import system default /tmp/enp0s8.ww /etc/network/interfaces.d/enp0s8.ww
sudo wwctl overlay chown system default /etc/network/interfaces.d/enp0s8.ww 0 0

sudo wwctl overlay import system default /tmp/ifcfg-enp0s8.ww /etc/sysconfig/network-scripts/ifcfg-enp0s8.ww
sudo wwctl overlay chown system default /etc/sysconfig/network-scripts/ifcfg-enp0s8.ww 0 0

sudo wwctl overlay import system default /tmp/ifcfg-enp0s8.xml.ww /etc/wicked/ifconfig/ifcfg-enp0s8.xml.ww
sudo wwctl overlay chown system default /etc/wicked/ifconfig/ifcfg-enp0s8.xml.ww 0 0

# Import the enp0s3 templates into the system overlay
sudo wwctl overlay import system default /tmp/enp0s3.ww /etc/network/interfaces.d/enp0s3.ww
sudo wwctl overlay chown system default /etc/network/interfaces.d/enp0s3.ww 0 0

sudo wwctl overlay import system default /tmp/ifcfg-enp0s3.ww /etc/sysconfig/network-scripts/ifcfg-enp0s3.ww
sudo wwctl overlay chown system default /etc/sysconfig/network-scripts/ifcfg-enp0s3.ww 0 0

sudo wwctl overlay import system default /tmp/ifcfg-enp0s3.xml.ww /etc/wicked/ifconfig/ifcfg-enp0s3.xml.ww
sudo wwctl overlay chown system default /etc/wicked/ifconfig/ifcfg-enp0s3.xml.ww 0 0

# Add default gateway
# This might be nice to add if/when more than one interface is configured for a node
# current template is hard-coded for the internal network interface
sudo wwctl overlay delete system default /etc/sysconfig/network.ww
sudo wwctl overlay import system default /tmp/network.ww /etc/sysconfig/network.ww
sudo wwctl overlay chown system default /etc/sysconfig/network.ww 0 0

# Add / Modify runtime overlays
sudo wwctl overlay import runtime default /etc/shadow /etc/shadow.ww
sudo wwctl overlay mkdir  runtime --mode 640 default /etc/sudoers.d
sudo wwctl overlay import runtime --mode 440 default /etc/sudoers.d/vagrant

# (Re)build all overlays
sudo wwctl overlay build -a
