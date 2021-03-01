#!/bin/bash

set -e
set -x

ISO="http://boot.ipxe.org/ipxe.iso"


# Download iPXE ISO to support warewulf bzImage

mkdir -p iso
pushd ./iso

test -f "$(basename "${ISO}")" || curl -LOR "$ISO"

popd

exit 0
