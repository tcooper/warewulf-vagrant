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
set +e
vagrant plugin list | grep -q "vagrant-reload"
ret=$?
set -e
if [[ $ret -ne 0 ]]; then
  vagrant plugin install vagrant-reload
  echo ""
  echo "If you wish to use vmware_fusion to run this environment please run..."
  echo "    vagrant plugin install vagrant-vmware-desktop"
  echo ""
  echo "...and the see..."
  echo ""
  echo "    https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility"
  echo ""
fi


# Add VirtualBox NAT Network
# NOTE: This needs something to detect natnetwork SUBNET collision with any
#       existing natnetwork along with auto-modification or notice to modify
#       vagrant-settings.yaml appropriately.
set +e
VBoxManage list natnets | grep "${NATNET_NAME}" >/dev/null 2>&1
ret=$?
set -e
if [[ $ret -ne 0 ]]; then
  VBoxManage natnetwork add --netname "${NATNET_NAME}" --network "${NATNET_NETWORK}" --enable --dhcp off
  VBoxManage natnetwork start --netname "${NATNET_NAME}"
else
  printf "NAT network %s already exists.\n" "${NATNET_NAME}"
fi

exit 0
