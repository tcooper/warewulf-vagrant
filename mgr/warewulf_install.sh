#!/usr/bin/env bash

# Download build and install Warewulf
git clone https://github.com/hpcng/warewulf.git
cd ./warewulf || exit
git checkout v4.2.0
make all
sudo make install
