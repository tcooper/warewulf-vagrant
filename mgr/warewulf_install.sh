#!/usr/bin/env bash

# Prepare rpmbuild directory
rpmdev-setuptree || exit

# Download and test build Warewulf
git clone https://github.com/hpcng/warewulf.git || exit
cd ./warewulf || exit
git checkout 4.2.x || exit
make all || exit
make dist || exit

# Copy spec and source to rpmbuild area and build rpm(s)
ver=$(awk '/^VERSION := / {print $3}' Makefile)
cp -v "_dist/warewulf-${ver}/warewulf.spec" ~/rpmbuild/SPECS || exit
cp -v "./warewulf-${ver}.tar.gz" ~/rpmbuild/SOURCES/ || exit
cd ~/rpmbuild/SPECS || exit
rpmbuild -ba warewulf.spec || exit

# Install rpm(s)
cd ~/rpmbuild/RPMS/x86_64 || exit
sudo dnf -y install warewulf-${ver}-1.el8.x86_64.rpm || exit
