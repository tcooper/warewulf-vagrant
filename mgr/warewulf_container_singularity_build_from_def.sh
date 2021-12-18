#!/usr/bin/env bash

set -e
set -x

CHROOT_DIR=/var/warewulf/chroots
CHROOT_NAME=centos8-singularity-def
BUILD_DIR="${HOME}/chroots/${CHROOT_NAME}"

# This container build requires running distro to be CentOS
if ! (awk -F\= '/^NAME/ {print $2}' /etc/os-release | grep -qi centos)
then
    printf "%s must be run on CentOS\n" "$0"
    exit 0
fi

# Add singularity
sudo dnf -y install singularity

# Copy my Singularity def into warewulf repository clone
sudo cp /tmp/centos-8.def "${HOME}/warewulf/centos-8.def"

# Create builddir for custom container
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"

# Build chroot with Singularity
sudo singularity build --sandbox ./rootfs "${HOME}/warewulf/centos-8.def"

# Customize the container chroot
sudo singularity exec --writable ./rootfs dnf -y install tcpdump tree

# Remove Singularity / Docker entrypoints from container
sudo singularity exec --writable ./rootfs /bin/rm -rf /environment /.exec /.run /.shell /singularity /.test /.singularity.d

# Copy chroot to container directory
sudo mkdir -p "${CHROOT_DIR}/${CHROOT_NAME}"
cd "${BUILD_DIR}"
sudo tar -cf - ./rootfs | (cd "${CHROOT_DIR}/${CHROOT_NAME}"; sudo tar -xf -)

# Build new image
sudo wwctl container build --force "${CHROOT_NAME}"
sudo wwctl container list

# Remove profile if it exists
set +e
sudo wwctl profile list | grep -q -E "^${CHROOT_NAME} "
ret=$?
set -e
if [[ $ret -eq 0 ]]; then
  # NOTE: wwctl profile delete could get a --yes option but this also works...
  yes | sudo wwctl profile delete "${CHROOT_NAME}"
fi

# Create custom profile for container
sudo wwctl profile add "${CHROOT_NAME}"
sudo wwctl profile set --yes --container "${CHROOT_NAME}" "${CHROOT_NAME}"
sudo wwctl profile set --yes --comment "This profile provides VNFS built using Singularity" "${CHROOT_NAME}"
sudo wwctl profile set --yes --kernel "$(uname -r)" "${CHROOT_NAME}"
