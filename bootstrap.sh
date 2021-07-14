#!/bin/bash

set -e
set -x

ISO="http://boot.ipxe.org/ipxe.iso"

NATNET_NAME="warewulf-natnet"
NATNET_PREFIX="192.168"
NATNET_SUBNET="15"
NATNET_NETWORK="${NATNET_PREFIX}.${NATNET_SUBNET}.0/24"

# Download iPXE ISO to support warewulf bzImage

mkdir -p iso
pushd ./iso
test -f "$(basename "${ISO}")" || curl -LOR "$ISO"
popd


# Add vagrant plugins
vagrant plugin install vagrant-reload


# Add VirtualBox NAT Network

VBoxManage list natnets | grep "${NATNET_NAME}" >/dev/null 2>&1
ret=$?
if [[ "$ret" -ne 0 ]]; then
  VBoxManage natnetwork add --netname "${NATNET_NAME}" --network "${NATNET_NETWORK}" --enable --dhcp off
  VBoxManage natnetwork start --netname "${NATNET_NAME}"
else
  printf "NAT network %s already exists.\n" "${NATNET_NAME}"
fi

exit 0
