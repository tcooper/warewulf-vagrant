#!/usr/bin/env bash

# Update to box OS
dnf -y update

# Disable selinux
sudo setenforce permissive

# Disable firewall
sudo systemctl stop firewalld
sudo systemctl disable firewalld
