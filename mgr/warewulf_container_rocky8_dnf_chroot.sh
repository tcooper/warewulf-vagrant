#!/usr/bin/env bash

set -e
set -x

container_name="${CONTAINER_NAME:-rocky8}"
container_build_dir="${HOME}/chroots/${container_name}"
os_release="${RELEASE:-8}"
download_url_base="${DOWNLOAD_URL_BASE:-http://dl.rockylinux.org/pub/rocky/${os_release}/BaseOS/x86_64/os/Packages}"
warewulf_chroot_dir="${WAREWULF_CHROOT_DIR:-/var/warewulf/chroots}"

# Create clean builddir for custom chroot built from scratch on CentOS 8 host
if [ -d "${container_build_dir}/rootfs" ]; then
  sudo /bin/rm -rf "${container_build_dir}/rootfs"
fi
mkdir -p "${container_build_dir}/rootfs"
cd "${container_build_dir}"

# Create empty RPM database
sudo rpm --root="${container_build_dir}/rootfs" --rebuilddb

# Download and install minimal RPMs to be support dnf --installroot
rpms_to_download=( rocky-release rocky-repos rocky-gpg-keys )
wget -qp "${download_url_base}/"
rpms_to_install=()
for r in "${rpms_to_download[@]}"; do
  x=$(sed -e 's/<[^<]*>//g' "$(find . -name index.html)" | grep "${r}" | awk '{print $1}' | sort -k1,1V | tail -n 1)
  wget -p "${download_url_base}/$x"
done
#rpms_to_install=( $(find "${container_build_dir}" -name "rocky*.rpm" -type f) )
mapfile -t rpms_to_install < <(find "${container_build_dir}" -name "rocky*.rpm" -type f)
sudo rpm --root="${container_build_dir}/rootfs" --nodeps -i "${rpms_to_install[@]}"

# Install minimal system into chroot using dnf to resolve all dependencies
sudo dnf --refresh --installroot "${container_build_dir}/rootfs" \
     install -y \
     basesystem bash chkconfig coreutils cpio cronie crontabs curl \
     dhclient dnf e2fsprogs ethtool filesystem findutils fipscheck fipscheck-lib \
     gawk grep gzip initscripts ipmitool iproute iputils less libndp net-tools \
     NetworkManager NetworkManager-libnm nfs-utils openssh-clients openssh-server \
     pam pciutils polkit-libs psmisc rsync rsyslog sed setup shadow-utils strace \
     sudo tar tzdata util-linux vim-minimal wget which words zlib

# Copy chroot to container directory
sudo mkdir -p "${warewulf_chroot_dir}/${container_name}"
cd "${container_build_dir}"
sudo tar -cf - ./rootfs | (cd "${warewulf_chroot_dir}/${container_name}"; sudo tar -xf -)

# Build container from chroot
sudo wwctl container build --force "${container_name}"
sudo wwctl container list

# Remove profile if it exists
set +e
sudo wwctl profile list | grep -q -E "^${container_name} "
ret=$?
set -e
if [[ $ret -eq 0 ]]; then
  # NOTE: wwctl profile delete could get a --yes option but this also works...
  yes | sudo wwctl profile delete "${container_name}"
fi

# Create custom profile for container
sudo wwctl profile add "${container_name}"
sudo wwctl profile set --yes --container "${container_name}" "${container_name}"
sudo wwctl profile set --yes --comment "This profile provides ${container_name} VNFS" "${container_name}"
sudo wwctl profile set --yes --kernel "$(uname -r)" "${container_name}"

# Apply the custom profile compute nodes
sudo wwctl node set --yes --addprofile "${container_name}" cn0
sudo wwctl node set --yes --addprofile "${container_name}" cn1
sudo wwctl node list --long
