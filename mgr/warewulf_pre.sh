#!/usr/bin/env bash

# Update to box OS
dnf -y update

# Disable selinux
sudo setenforce permissive

# Disable firewall
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Fixup /etc/hosts which is mangled by Vagrant
# See: https://github.com/hashicorp/vagrant/issues/7263
# Remove entries created by vagrant:
sudo sed -i "/$(hostname)/d" /etc/hosts

# Remove entry from base box
sudo sed -i "/centos8/d" /etc/hosts

# Create the entries we want
HOSTS_TMPL=/tmp/hosts
(
cat << 'TEMPLATE'

192.168.15.15    mgr.example.com mgr

TEMPLATE
) > $HOSTS_TMPL
(sudo tee /etc/hosts) < /tmp/hosts
