#!/usr/bin/env bash

set -e

CHROOT_DIR=/var/warewulf/chroots
CHROOT_NAME=centos8-dnf-chroot
BUILD_DIR="${HOME}/chroots/${CHROOT_NAME}"

# Create builddir for custom chroot built from scratch on CentOS 8 host
mkdir -p "${BUILD_DIR}/rootfs"
cd "${BUILD_DIR}"

# Create empty RPM database
sudo rpm --root="${BUILD_DIR}/rootfs" --rebuilddb

# Download and install minimal RPMs to be support dnf --installroot
dnf download centos-release centos-linux-repos centos-gpg-keys
sudo rpm --root="${BUILD_DIR}/rootfs" --nodeps -i centos-linux-release-*.el8.noarch.rpm
sudo rpm --root="${BUILD_DIR}/rootfs" -i centos-linux-repos-*.el8.noarch.rpm centos-gpg-keys-*.el8.noarch.rpm

# Install minimal system into chroot
sudo dnf --installroot "${BUILD_DIR}/rootfs" install -y \
     basesystem bash centos-release chkconfig coreutils cpio cronie crontabs \
     dhclient dnf e2fsprogs ethtool filesystem findutils fipscheck fipscheck-lib \
     gawk grep gzip initscripts ipmitool iproute iputils less libndp net-tools \
     NetworkManager NetworkManager-libnm nfs-utils openssh-clients openssh-server \
     pam pciutils polkit-libs psmisc rsync rsyslog sed setup shadow-utils strace \
     sudo tar tzdata util-linux vim-minimal wget which words zlib

# Copy chroot to container directory
sudo mkdir -p "${CHROOT_DIR}/${CHROOT_NAME}"
cd "${BUILD_DIR}"
sudo tar -cf - ./rootfs | (cd "${CHROOT_DIR}/${CHROOT_NAME}"; sudo tar -xf -)

# Build new image
sudo wwctl container build --force "${CHROOT_NAME}"
sudo wwctl container list

# Create custom profile for container
sudo wwctl profile add "${CHROOT_NAME}"
sudo wwctl profile set --yes --container "${CHROOT_NAME}" "${CHROOT_NAME}"
sudo wwctl profile set --yes --comment "This profile provides VNFS built using dnf into chroot" "${CHROOT_NAME}"
sudo wwctl profile set --yes --kernel "$(uname -r)" "${CHROOT_NAME}"

# Apply the custom profile to cn0
sudo wwctl node set --yes --addprofile "${CHROOT_NAME}" cn0
sudo wwctl node set --yes --addprofile "${CHROOT_NAME}" cn1
sudo wwctl node list --long
