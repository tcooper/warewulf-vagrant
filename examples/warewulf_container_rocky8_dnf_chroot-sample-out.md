# Rocky Linux 8 VNFS Container Creation

This is sample output from `warewulf_container_rocky8_dnf_chroot.sh` run inside
the manager node.

```
[vagrant@mgr ~]$ ./warewulf_container_rocky8_dnf_chroot.sh
+ container_name=rocky8
+ container_build_dir=/home/vagrant/chroots/rocky8
+ os_release=8.3
+ download_url_base=http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages
+ warewulf_chroot_dir=/var/warewulf/chroots
+ '[' -d /home/vagrant/chroots/rocky8/rootfs ']'
+ sudo /bin/rm -rf /home/vagrant/chroots/rocky8/rootfs
+ mkdir -p /home/vagrant/chroots/rocky8/rootfs
+ cd /home/vagrant/chroots/rocky8
+ sudo rpm --root=/home/vagrant/chroots/rocky8/rootfs --rebuilddb
+ rpms_to_download=(rocky-release rocky-repos rocky-gpg-keys)
+ wget -qp http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/
+ rpms_to_install=()
+ for r in "${rpms_to_download[@]}"
++ grep rocky-release
++ awk '{print $1}'
+++ find . -name index.html
++ sed -e 's/<[^<]*>//g' ./dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/index.html
+ x=rocky-release-8.3-13.el8.noarch.rpm
+ wget -p http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-release-8.3-13.el8.noarch.rpm
--2021-05-04 22:15:29--  http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-release-8.3-13.el8.noarch.rpm
Resolving dl.rockylinux.org (dl.rockylinux.org)... 199.232.94.132, 2a04:4e42:2e::644
Connecting to dl.rockylinux.org (dl.rockylinux.org)|199.232.94.132|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 22116 (22K) [application/x-redhat-package-manager]
Saving to: ‘dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-release-8.3-13.el8.noarch.rpm’

dl.rockylinux.org/pub/rocky/8 100%[=================================================>]  21.60K  --.-KB/s    in 0.02s

2021-05-04 22:15:29 (1.29 MB/s) - ‘dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-release-8.3-13.el8.noarch.rpm’ saved [22116/22116]

FINISHED --2021-05-04 22:15:29--
Total wall clock time: 0.08s
Downloaded: 1 files, 22K in 0.02s (1.29 MB/s)
+ for r in "${rpms_to_download[@]}"
++ grep rocky-repos
++ awk '{print $1}'
+++ find . -name index.html
++ sed -e 's/<[^<]*>//g' ./dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/index.html
+ x=rocky-repos-8.3-13.el8.noarch.rpm
+ wget -p http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-repos-8.3-13.el8.noarch.rpm
--2021-05-04 22:15:29--  http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-repos-8.3-13.el8.noarch.rpm
Resolving dl.rockylinux.org (dl.rockylinux.org)... 199.232.94.132, 2a04:4e42:2e::644
Connecting to dl.rockylinux.org (dl.rockylinux.org)|199.232.94.132|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 17200 (17K) [application/x-redhat-package-manager]
Saving to: ‘dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-repos-8.3-13.el8.noarch.rpm’

dl.rockylinux.org/pub/rocky/8 100%[=================================================>]  16.80K  --.-KB/s    in 0.002s

2021-05-04 22:15:29 (8.67 MB/s) - ‘dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-repos-8.3-13.el8.noarch.rpm’ saved [17200/17200]

FINISHED --2021-05-04 22:15:29--
Total wall clock time: 0.06s
Downloaded: 1 files, 17K in 0.002s (8.67 MB/s)
+ for r in "${rpms_to_download[@]}"
++ grep rocky-gpg-keys
++ awk '{print $1}'
+++ find . -name index.html
++ sed -e 's/<[^<]*>//g' ./dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/index.html
+ x=rocky-gpg-keys-8.3-13.el8.noarch.rpm
+ wget -p http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-gpg-keys-8.3-13.el8.noarch.rpm
--2021-05-04 22:15:29--  http://dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-gpg-keys-8.3-13.el8.noarch.rpm
Resolving dl.rockylinux.org (dl.rockylinux.org)... 199.232.94.132, 2a04:4e42:2e::644
Connecting to dl.rockylinux.org (dl.rockylinux.org)|199.232.94.132|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10508 (10K) [application/x-redhat-package-manager]
Saving to: ‘dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-gpg-keys-8.3-13.el8.noarch.rpm’

dl.rockylinux.org/pub/rocky/8 100%[=================================================>]  10.26K  --.-KB/s    in 0.001s

2021-05-04 22:15:29 (7.19 MB/s) - ‘dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-gpg-keys-8.3-13.el8.noarch.rpm’ saved [10508/10508]

FINISHED --2021-05-04 22:15:29--
Total wall clock time: 0.05s
Downloaded: 1 files, 10K in 0.001s (7.19 MB/s)
+ mapfile -t rpms_to_install
++ find /home/vagrant/chroots/rocky8 -name 'rocky*.rpm' -type f
+ sudo rpm --root=/home/vagrant/chroots/rocky8/rootfs --nodeps -i /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-release-8.3-13.el8.noarch.rpm /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-repos-8.3-13.el8.noarch.rpm /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-gpg-keys-8.3-13.el8.noarch.rpm
warning: /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8.3/BaseOS/x86_64/os/Packages/rocky-release-8.3-13.el8.noarch.rpm: Header V4 RSA/SHA256 Signature, key ID 6d745a60: NOKEY
+ sudo dnf --refresh --installroot /home/vagrant/chroots/rocky8/rootfs install -y basesystem bash chkconfig coreutils cpio cronie crontabs curl dhclient dnf e2fsprogs ethtool filesystem findutils fipscheck fipscheck-lib gawk grep gzip initscripts ipmitool iproute iputils less libndp net-tools NetworkManager NetworkManager-libnm nfs-utils openssh-clients openssh-server pam pciutils polkit-libs psmisc rsync rsyslog sed setup shadow-utils strace sudo tar tzdata util-linux vim-minimal wget which words zlib
Rocky Linux 8 - AppStream                                                               5.7 MB/s | 6.7 MB     00:01
Rocky Linux 8 - BaseOS                                                                  3.3 MB/s | 2.5 MB     00:00
Rocky Linux 8 - Extras                                                                  2.9 kB/s | 1.6 kB     00:00
Dependencies resolved.
========================================================================================================================
 Package                              Architecture    Version                                  Repository          Size
========================================================================================================================
Installing:
 NetworkManager                       x86_64          1:1.26.0-13.el8                          baseos             2.4 M
 NetworkManager-libnm                 x86_64          1:1.26.0-13.el8                          baseos             1.7 M
 basesystem                           noarch          11-5.el8                                 baseos             9.3 k
 bash                                 x86_64          4.4.19-12.el8                            baseos             1.5 M
 chkconfig                            x86_64          1.13-2.el8                               baseos             193 k
 coreutils                            x86_64          8.30-8.el8                               baseos             1.2 M
 cpio                                 x86_64          2.12-8.el8                               baseos             264 k
 cronie                               x86_64          1.5.2-4.el8                              baseos             117 k
 crontabs                             noarch          1.11-16.20150630git.el8                  baseos              24 k
 curl                                 x86_64          7.61.1-14.el8.1                          baseos             352 k
 dhcp-client                          x86_64          12:4.3.6-41.el8                          baseos             317 k
 dnf                                  noarch          4.2.23-4.el8                             baseos             512 k
 e2fsprogs                            x86_64          1.45.6-1.el8                             baseos             1.0 M
 ethtool                              x86_64          2:5.0-2.el8                              baseos             150 k
 filesystem                           x86_64          3.8-3.el8                                baseos             1.1 M
 findutils                            x86_64          1:4.6.0-20.el8                           baseos             526 k
 fipscheck                            x86_64          1.5.0-4.el8                              baseos              26 k
 fipscheck-lib                        x86_64          1.5.0-4.el8                              baseos              14 k
 gawk                                 x86_64          4.2.1-1.el8                              baseos             1.1 M
 grep                                 x86_64          3.1-6.el8                                baseos             272 k
 gzip                                 x86_64          1.9-9.el8                                baseos             165 k
 initscripts                          x86_64          10.00.9-1.el8                            baseos             337 k
 ipmitool                             x86_64          1.8.18-17.el8                            appstream          394 k
 iproute                              x86_64          5.3.0-5.el8                              baseos             664 k
 iputils                              x86_64          20180629-2.el8                           baseos             147 k
 less                                 x86_64          530-1.el8                                baseos             163 k
 libndp                               x86_64          1.7-3.el8                                baseos              39 k
 net-tools                            x86_64          2.0-0.52.20160912git.el8                 baseos             321 k
 nfs-utils                            x86_64          1:2.3.3-35.el8                           baseos             493 k
 openssh-clients                      x86_64          8.0p1-5.el8                              baseos             666 k
 openssh-server                       x86_64          8.0p1-5.el8                              baseos             482 k
 pam                                  x86_64          1.3.1-11.el8                             baseos             737 k
 pciutils                             x86_64          3.6.4-2.el8                              baseos             101 k
 polkit-libs                          x86_64          0.115-11.el8                             baseos              75 k
 psmisc                               x86_64          23.1-5.el8                               baseos             150 k
 rsync                                x86_64          3.1.3-9.el8                              baseos             403 k
 rsyslog                              x86_64          8.1911.0-6.el8                           appstream          730 k
 sed                                  x86_64          4.5-2.el8                                baseos             297 k
 setup                                noarch          2.12.2-6.el8                             baseos             180 k
 shadow-utils                         x86_64          2:4.6-11.el8                             baseos             1.2 M
 strace                               x86_64          5.1-1.el8                                baseos             1.0 M
 sudo                                 x86_64          1.8.29-6.el8.1                           baseos             922 k
 tar                                  x86_64          2:1.30-5.el8                             baseos             837 k
 tzdata                               noarch          2021a-1.el8                              baseos             472 k
 util-linux                           x86_64          2.32.1-24.el8                            baseos             2.5 M
 vim-minimal                          x86_64          2:8.0.1763-15.el8                        baseos             572 k
 wget                                 x86_64          1.19.5-10.el8                            appstream          733 k
 which                                x86_64          2.21-12.el8                              baseos              48 k
 words                                noarch          3.0-28.el8                               baseos             1.4 M
 zlib                                 x86_64          1.2.11-16.2.el8                          baseos             101 k
Installing dependencies:
 acl                                  x86_64          2.2.53-1.el8                             baseos              80 k
 audit-libs                           x86_64          3.0-0.17.20191104git1c2f876.el8          baseos             115 k
 bind-export-libs                     x86_64          32:9.11.20-5.el8.1                       baseos             1.1 M
 brotli                               x86_64          1.0.6-2.el8                              baseos             321 k
 bzip2-libs                           x86_64          1.0.6-26.el8                             baseos              47 k
 ca-certificates                      noarch          2020.2.41-80.0.el8_2                     baseos             390 k
 coreutils-common                     x86_64          8.30-8.el8                               baseos             2.0 M
 cracklib                             x86_64          2.9.6-15.el8                             baseos              92 k
 cronie-anacron                       x86_64          1.5.2-4.el8                              baseos              40 k
 crypto-policies                      noarch          20210209-1.gitbfb6bed.el8                baseos              61 k
 cryptsetup-libs                      x86_64          2.3.3-2.el8                              baseos             469 k
 cyrus-sasl-lib                       x86_64          2.1.27-5.el8                             baseos             122 k
 dbus                                 x86_64          1:1.12.8-12.el8                          baseos              40 k
 dbus-common                          noarch          1:1.12.8-12.el8                          baseos              44 k
 dbus-daemon                          x86_64          1:1.12.8-12.el8                          baseos             239 k
 dbus-glib                            x86_64          0.110-2.el8                              baseos             126 k
 dbus-libs                            x86_64          1:1.12.8-12.el8                          baseos             182 k
 dbus-tools                           x86_64          1:1.12.8-12.el8                          baseos              84 k
 device-mapper                        x86_64          8:1.02.171-5.el8.2                       baseos             372 k
 device-mapper-libs                   x86_64          8:1.02.171-5.el8.2                       baseos             405 k
 dhcp-common                          noarch          12:4.3.6-41.el8                          baseos             206 k
 dhcp-libs                            x86_64          12:4.3.6-41.el8                          baseos             146 k
 diffutils                            x86_64          3.6-6.el8                                baseos             358 k
 dnf-data                             noarch          4.2.23-4.el8                             baseos             148 k
 dracut                               x86_64          049-95.git20200804.el8.4                 baseos             367 k
 e2fsprogs-libs                       x86_64          1.45.6-1.el8                             baseos             232 k
 elfutils-default-yama-scope          noarch          0.180-1.el8                              baseos              47 k
 elfutils-libelf                      x86_64          0.180-1.el8                              baseos             213 k
 elfutils-libs                        x86_64          0.180-1.el8                              baseos             292 k
 expat                                x86_64          2.2.5-4.el8                              baseos             110 k
 file                                 x86_64          5.33-16.el8.1                            baseos              75 k
 file-libs                            x86_64          5.33-16.el8.1                            baseos             542 k
 fuse-libs                            x86_64          2.9.7-12.el8                             baseos             101 k
 gdbm                                 x86_64          1:1.18-1.el8                             baseos             129 k
 gdbm-libs                            x86_64          1:1.18-1.el8                             baseos              59 k
 gettext                              x86_64          0.19.8.1-17.el8                          baseos             1.1 M
 gettext-libs                         x86_64          0.19.8.1-17.el8                          baseos             309 k
 glib2                                x86_64          2.56.4-8.el8                             baseos             2.5 M
 glibc                                x86_64          2.28-127.el8.2                           baseos             3.6 M
 glibc-all-langpacks                  x86_64          2.28-127.el8.2                           baseos              25 M
 glibc-common                         x86_64          2.28-127.el8.2                           baseos             1.3 M
 gmp                                  x86_64          1:6.1.2-10.el8                           baseos             317 k
 gnupg2                               x86_64          2.2.20-2.el8                             baseos             2.4 M
 gnutls                               x86_64          3.6.14-8.el8                             baseos             1.0 M
 gpgme                                x86_64          1.13.1-3.el8                             baseos             334 k
 grub2-common                         noarch          1:2.02-90.el8.1                          baseos             885 k
 grub2-tools                          x86_64          1:2.02-90.el8.1                          baseos             2.0 M
 grub2-tools-minimal                  x86_64          1:2.02-90.el8.1                          baseos             205 k
 gssproxy                             x86_64          0.8.0-16.el8                             baseos             117 k
 hwdata                               noarch          0.314-8.6.el8                            baseos             1.6 M
 ima-evm-utils                        x86_64          1.1-5.el8                                baseos              54 k
 info                                 x86_64          6.5-6.el8                                baseos             197 k
 ipcalc                               x86_64          0.2.4-4.el8                              baseos              37 k
 iptables-libs                        x86_64          1.8.4-15.el8.3                           baseos             105 k
 json-c                               x86_64          0.13.1-0.2.el8                           baseos              39 k
 kbd-legacy                           noarch          2.0.4-10.el8                             baseos             480 k
 kbd-misc                             noarch          2.0.4-10.el8                             baseos             1.5 M
 keyutils                             x86_64          1.5.10-6.el8                             baseos              62 k
 keyutils-libs                        x86_64          1.5.10-6.el8                             baseos              33 k
 kmod                                 x86_64          25-16.el8.1                              baseos             125 k
 kmod-libs                            x86_64          25-16.el8.1                              baseos              67 k
 krb5-libs                            x86_64          1.18.2-5.el8                             baseos             836 k
 libacl                               x86_64          2.2.53-1.el8                             baseos              33 k
 libarchive                           x86_64          3.3.2-9.el8                              baseos             357 k
 libassuan                            x86_64          2.5.1-3.el8                              baseos              81 k
 libattr                              x86_64          2.4.48-3.el8                             baseos              26 k
 libbasicobjects                      x86_64          0.1.1-39.el8                             baseos              30 k
 libblkid                             x86_64          2.32.1-24.el8                            baseos             215 k
 libcap                               x86_64          2.26-4.el8                               baseos              59 k
 libcap-ng                            x86_64          0.7.9-5.el8                              baseos              32 k
 libcollection                        x86_64          0.7.0-39.el8                             baseos              47 k
 libcom_err                           x86_64          1.45.6-1.el8                             baseos              48 k
 libcomps                             x86_64          0.1.11-4.el8                             baseos              80 k
 libcroco                             x86_64          0.6.12-4.el8_2.1                         baseos             112 k
 libcurl                              x86_64          7.61.1-14.el8.1                          baseos             298 k
 libdb                                x86_64          5.3.28-39.el8                            baseos             749 k
 libdb-utils                          x86_64          5.3.28-39.el8                            baseos             148 k
 libdnf                               x86_64          0.48.0-5.el8                             baseos             649 k
 libedit                              x86_64          3.1-23.20170329cvs.el8                   baseos             102 k
 libestr                              x86_64          0.1.10-1.el8                             appstream           26 k
 libevent                             x86_64          2.1.8-5.el8                              baseos             252 k
 libfastjson                          x86_64          0.99.8-2.el8                             appstream           36 k
 libfdisk                             x86_64          2.32.1-24.el8                            baseos             248 k
 libffi                               x86_64          3.1-22.el8                               baseos              36 k
 libgcc                               x86_64          8.3.1-5.1.el8                            baseos              77 k
 libgcrypt                            x86_64          1.8.5-4.el8                              baseos             461 k
 libgomp                              x86_64          8.3.1-5.1.el8                            baseos             203 k
 libgpg-error                         x86_64          1.31-1.el8                               baseos             240 k
 libidn2                              x86_64          2.2.0-1.el8                              baseos              92 k
 libini_config                        x86_64          1.3.1-39.el8                             baseos              69 k
 libkcapi                             x86_64          1.2.0-2.el8                              baseos              47 k
 libkcapi-hmaccalc                    x86_64          1.2.0-2.el8                              baseos              30 k
 libksba                              x86_64          1.3.5-7.el8                              baseos             133 k
 libmetalink                          x86_64          0.1.3-7.el8                              baseos              31 k
 libmnl                               x86_64          1.0.4-6.el8                              baseos              29 k
 libmodulemd                          x86_64          2.9.4-2.el8                              baseos             188 k
 libmount                             x86_64          2.32.1-24.el8                            baseos             231 k
 libnfsidmap                          x86_64          1:2.3.3-35.el8                           baseos             118 k
 libnghttp2                           x86_64          1.33.0-3.el8_3.1                         baseos              76 k
 libnsl2                              x86_64          1.2.0-2.20180605git4a062cf.el8           baseos              56 k
 libpath_utils                        x86_64          0.2.1-39.el8                             baseos              33 k
 libpcap                              x86_64          14:1.9.1-4.el8                           baseos             165 k
 libpsl                               x86_64          0.20.2-6.el8                             baseos              60 k
 libpwquality                         x86_64          1.4.0-9.el8                              baseos             101 k
 libref_array                         x86_64          0.1.5-39.el8                             baseos              32 k
 librepo                              x86_64          1.12.0-2.el8                             baseos              89 k
 libreport-filesystem                 x86_64          2.9.5-15.el8.rocky                       baseos              20 k
 libseccomp                           x86_64          2.4.3-1.el8                              baseos              66 k
 libsecret                            x86_64          0.18.6-1.el8                             baseos             162 k
 libselinux                           x86_64          2.9-4.el8_3                              baseos             164 k
 libselinux-utils                     x86_64          2.9-4.el8_3                              baseos             242 k
 libsemanage                          x86_64          2.9-3.el8                                baseos             164 k
 libsepol                             x86_64          2.9-1.el8                                baseos             338 k
 libsigsegv                           x86_64          2.11-5.el8                               baseos              29 k
 libsmartcols                         x86_64          2.32.1-24.el8                            baseos             174 k
 libsolv                              x86_64          0.7.11-1.el8                             baseos             357 k
 libss                                x86_64          1.45.6-1.el8                             baseos              52 k
 libssh                               x86_64          0.9.4-2.el8                              baseos             213 k
 libssh-config                        noarch          0.9.4-2.el8                              baseos              17 k
 libstdc++                            x86_64          8.3.1-5.1.el8                            baseos             450 k
 libtasn1                             x86_64          4.13-3.el8                               baseos              75 k
 libtirpc                             x86_64          1.1.4-4.el8                              baseos             111 k
 libunistring                         x86_64          0.9.9-3.el8                              baseos             419 k
 libusbx                              x86_64          1.0.23-4.el8                             baseos              73 k
 libutempter                          x86_64          1.1.6-14.el8                             baseos              31 k
 libuuid                              x86_64          2.32.1-24.el8                            baseos              94 k
 libverto                             x86_64          0.3.0-5.el8                              baseos              23 k
 libverto-libevent                    x86_64          0.3.0-5.el8                              baseos              15 k
 libxcrypt                            x86_64          4.1.1-4.el8                              baseos              71 k
 libxml2                              x86_64          2.9.7-8.el8                              baseos             695 k
 libyaml                              x86_64          0.1.7-5.el8                              baseos              60 k
 libzstd                              x86_64          1.4.4-1.el8                              baseos             265 k
 logrotate                            x86_64          3.14.0-4.el8                             baseos              85 k
 lua-libs                             x86_64          5.3.4-11.el8                             baseos             117 k
 lz4-libs                             x86_64          1.8.3-2.el8                              baseos              65 k
 mpfr                                 x86_64          3.1.6-1.el8                              baseos             219 k
 ncurses                              x86_64          6.1-7.20180224.el8                       baseos             386 k
 ncurses-base                         noarch          6.1-7.20180224.el8                       baseos              80 k
 ncurses-libs                         x86_64          6.1-7.20180224.el8                       baseos             332 k
 nettle                               x86_64          3.4.1-2.el8                              baseos             299 k
 npth                                 x86_64          1.5-4.el8                                baseos              25 k
 openldap                             x86_64          2.4.46-15.el8                            baseos             350 k
 openssh                              x86_64          8.0p1-5.el8                              baseos             520 k
 openssl                              x86_64          1:1.1.1g-15.el8                          baseos             706 k
 openssl-libs                         x86_64          1:1.1.1g-15.el8                          baseos             1.5 M
 os-prober                            x86_64          1.74-6.el8                               baseos              50 k
 p11-kit                              x86_64          0.23.14-5.el8_0                          baseos             272 k
 p11-kit-trust                        x86_64          0.23.14-5.el8_0                          baseos             137 k
 pciutils-libs                        x86_64          3.6.4-2.el8                              baseos              53 k
 pcre                                 x86_64          8.42-4.el8                               baseos             209 k
 pcre2                                x86_64          10.32-2.el8                              baseos             245 k
 platform-python                      x86_64          3.6.8-31.el8                             baseos              82 k
 platform-python-setuptools           noarch          39.2.0-6.el8                             baseos             630 k
 policycoreutils                      x86_64          2.9-9.el8                                baseos             376 k
 popt                                 x86_64          1.16-14.el8                              baseos              60 k
 procps-ng                            x86_64          3.3.15-3.el8                             baseos             327 k
 publicsuffix-list-dafsa              noarch          20180723-1.el8                           baseos              55 k
 python3-dnf                          noarch          4.2.23-4.el8                             baseos             525 k
 python3-gpg                          x86_64          1.13.1-3.el8                             baseos             243 k
 python3-hawkey                       x86_64          0.48.0-5.el8                             baseos             110 k
 python3-libcomps                     x86_64          0.1.11-4.el8                             baseos              51 k
 python3-libdnf                       x86_64          0.48.0-5.el8                             baseos             755 k
 python3-libs                         x86_64          3.6.8-31.el8                             baseos             7.8 M
 python3-pip-wheel                    noarch          9.0.3-18.el8                             baseos             1.0 M
 python3-pyyaml                       x86_64          3.12-12.el8                              baseos             192 k
 python3-rpm                          x86_64          4.14.3-4.el8                             baseos             156 k
 python3-setuptools-wheel             noarch          39.2.0-6.el8                             baseos             286 k
 quota                                x86_64          1:4.04-10.el8                            baseos             212 k
 quota-nls                            noarch          1:4.04-10.el8                            baseos              93 k
 readline                             x86_64          7.0-10.el8                               baseos             198 k
 rpcbind                              x86_64          1.2.5-7.el8                              baseos              69 k
 rpm                                  x86_64          4.14.3-4.el8                             baseos             540 k
 rpm-build-libs                       x86_64          4.14.3-4.el8                             baseos             153 k
 rpm-libs                             x86_64          4.14.3-4.el8                             baseos             337 k
 sqlite-libs                          x86_64          3.26.0-11.el8                            baseos             579 k
 systemd                              x86_64          239-41.el8.2                             baseos             3.5 M
 systemd-libs                         x86_64          239-41.el8.2                             baseos             1.1 M
 systemd-pam                          x86_64          239-41.el8.2                             baseos             455 k
 systemd-udev                         x86_64          239-41.el8.2                             baseos             1.3 M
 trousers-lib                         x86_64          0.3.14-4.el8                             baseos             166 k
 unbound-libs                         x86_64          1.7.3-14.el8                             appstream          499 k
 xkeyboard-config                     noarch          2.28-1.el8                               appstream          781 k
 xz                                   x86_64          5.2.4-3.el8                              baseos             152 k
 xz-libs                              x86_64          5.2.4-3.el8                              baseos              93 k
Installing weak dependencies:
 cracklib-dicts                       x86_64          2.9.6-15.el8                             baseos             4.0 M
 crypto-policies-scripts              noarch          20210209-1.gitbfb6bed.el8                baseos              66 k
 elfutils-debuginfod-client           x86_64          0.180-1.el8                              baseos              63 k
 geolite2-city                        noarch          20180605-1.el8                           appstream           19 M
 geolite2-country                     noarch          20180605-1.el8                           appstream          1.0 M
 gnupg2-smime                         x86_64          2.2.20-2.el8                             baseos             282 k
 grubby                               x86_64          8.40-41.el8                              baseos              48 k
 hardlink                             x86_64          1:1.3-6.el8                              baseos              28 k
 kbd                                  x86_64          2.0.4-10.el8                             baseos             389 k
 kpartx                               x86_64          0.8.4-5.el8                              baseos             107 k
 libmaxminddb                         x86_64          1.2.0-10.el8                             appstream           32 k
 libxkbcommon                         x86_64          0.9.1-1.el8                              appstream          115 k
 memstrack                            x86_64          0.1.11-1.el8                             baseos              46 k
 openssl-pkcs11                       x86_64          0.4.10-2.el8                             baseos              65 k
 pigz                                 x86_64          2.4-4.el8                                baseos              78 k
 pinentry                             x86_64          1.1.0-2.el8                              appstream           99 k
 platform-python-pip                  noarch          9.0.3-18.el8                             baseos             1.7 M
 python3-dbus                         x86_64          1.2.4-15.el8                             baseos             133 k
 python3-unbound                      x86_64          1.7.3-14.el8                             appstream          117 k
 rpm-plugin-systemd-inhibit           x86_64          4.14.3-4.el8                             baseos              75 k
 shared-mime-info                     x86_64          1.9-3.el8                                baseos             328 k
 trousers                             x86_64          0.3.14-4.el8                             baseos             151 k

Transaction Summary
========================================================================================================================
Install  256 Packages

Total download size: 151 M
Installed size: 829 M
Downloading Packages:
(1/256): ipmitool-1.8.18-17.el8.x86_64.rpm                                              1.7 MB/s | 394 kB     00:00
(2/256): libestr-0.1.10-1.el8.x86_64.rpm                                                862 kB/s |  26 kB     00:00
(3/256): libfastjson-0.99.8-2.el8.x86_64.rpm                                            1.2 MB/s |  36 kB     00:00
(4/256): libmaxminddb-1.2.0-10.el8.x86_64.rpm                                           822 kB/s |  32 kB     00:00
(5/256): geolite2-country-20180605-1.el8.noarch.rpm                                     3.1 MB/s | 1.0 MB     00:00
(6/256): libxkbcommon-0.9.1-1.el8.x86_64.rpm                                            3.4 MB/s | 115 kB     00:00
(7/256): pinentry-1.1.0-2.el8.x86_64.rpm                                                2.6 MB/s |  99 kB     00:00
(8/256): python3-unbound-1.7.3-14.el8.x86_64.rpm                                        3.6 MB/s | 117 kB     00:00
(9/256): rsyslog-8.1911.0-6.el8.x86_64.rpm                                              7.6 MB/s | 730 kB     00:00
(10/256): unbound-libs-1.7.3-14.el8.x86_64.rpm                                          3.1 MB/s | 499 kB     00:00
(11/256): wget-1.19.5-10.el8.x86_64.rpm                                                 5.4 MB/s | 733 kB     00:00
(12/256): xkeyboard-config-2.28-1.el8.noarch.rpm                                        5.4 MB/s | 781 kB     00:00
(13/256): NetworkManager-1.26.0-13.el8.x86_64.rpm                                       6.8 MB/s | 2.4 MB     00:00
(14/256): NetworkManager-libnm-1.26.0-13.el8.x86_64.rpm                                 6.0 MB/s | 1.7 MB     00:00
(15/256): acl-2.2.53-1.el8.x86_64.rpm                                                   859 kB/s |  80 kB     00:00
(16/256): audit-libs-3.0-0.17.20191104git1c2f876.el8.x86_64.rpm                         1.5 MB/s | 115 kB     00:00
(17/256): basesystem-11-5.el8.noarch.rpm                                                106 kB/s | 9.3 kB     00:00
(18/256): bash-4.4.19-12.el8.x86_64.rpm                                                 6.4 MB/s | 1.5 MB     00:00
(19/256): bind-export-libs-9.11.20-5.el8.1.x86_64.rpm                                   4.2 MB/s | 1.1 MB     00:00
(20/256): bzip2-libs-1.0.6-26.el8.x86_64.rpm                                            596 kB/s |  47 kB     00:00
(21/256): brotli-1.0.6-2.el8.x86_64.rpm                                                 1.6 MB/s | 321 kB     00:00
(22/256): ca-certificates-2020.2.41-80.0.el8_2.noarch.rpm                               3.1 MB/s | 390 kB     00:00
(23/256): chkconfig-1.13-2.el8.x86_64.rpm                                               1.3 MB/s | 193 kB     00:00
(24/256): geolite2-city-20180605-1.el8.noarch.rpm                                       9.5 MB/s |  19 MB     00:01
(25/256): coreutils-8.30-8.el8.x86_64.rpm                                               2.8 MB/s | 1.2 MB     00:00
(26/256): cpio-2.12-8.el8.x86_64.rpm                                                    2.6 MB/s | 264 kB     00:00
(27/256): cracklib-2.9.6-15.el8.x86_64.rpm                                              1.8 MB/s |  92 kB     00:00
(28/256): cronie-1.5.2-4.el8.x86_64.rpm                                                 1.7 MB/s | 117 kB     00:00
(29/256): coreutils-common-8.30-8.el8.x86_64.rpm                                        3.7 MB/s | 2.0 MB     00:00
(30/256): cronie-anacron-1.5.2-4.el8.x86_64.rpm                                         676 kB/s |  40 kB     00:00
(31/256): crontabs-1.11-16.20150630git.el8.noarch.rpm                                   630 kB/s |  24 kB     00:00
(32/256): crypto-policies-scripts-20210209-1.gitbfb6bed.el8.noarch.rpm                  1.3 MB/s |  66 kB     00:00
(33/256): cracklib-dicts-2.9.6-15.el8.x86_64.rpm                                         13 MB/s | 4.0 MB     00:00
(34/256): cryptsetup-libs-2.3.3-2.el8.x86_64.rpm                                        3.3 MB/s | 469 kB     00:00
(35/256): crypto-policies-20210209-1.gitbfb6bed.el8.noarch.rpm                          259 kB/s |  61 kB     00:00
(36/256): curl-7.61.1-14.el8.1.x86_64.rpm                                               5.4 MB/s | 352 kB     00:00
(37/256): cyrus-sasl-lib-2.1.27-5.el8.x86_64.rpm                                        2.1 MB/s | 122 kB     00:00
(38/256): dbus-1.12.8-12.el8.x86_64.rpm                                                 1.3 MB/s |  40 kB     00:00
(39/256): dbus-common-1.12.8-12.el8.noarch.rpm                                          1.2 MB/s |  44 kB     00:00
(40/256): dbus-daemon-1.12.8-12.el8.x86_64.rpm                                          5.5 MB/s | 239 kB     00:00
(41/256): dbus-glib-0.110-2.el8.x86_64.rpm                                              4.2 MB/s | 126 kB     00:00
(42/256): dbus-libs-1.12.8-12.el8.x86_64.rpm                                            2.3 MB/s | 182 kB     00:00
(43/256): dbus-tools-1.12.8-12.el8.x86_64.rpm                                           1.2 MB/s |  84 kB     00:00
(44/256): device-mapper-1.02.171-5.el8.2.x86_64.rpm                                     4.1 MB/s | 372 kB     00:00
(45/256): device-mapper-libs-1.02.171-5.el8.2.x86_64.rpm                                5.9 MB/s | 405 kB     00:00
(46/256): dhcp-client-4.3.6-41.el8.x86_64.rpm                                           4.1 MB/s | 317 kB     00:00
(47/256): dhcp-common-4.3.6-41.el8.noarch.rpm                                           3.4 MB/s | 206 kB     00:00
(48/256): dhcp-libs-4.3.6-41.el8.x86_64.rpm                                             2.3 MB/s | 146 kB     00:00
(49/256): diffutils-3.6-6.el8.x86_64.rpm                                                5.1 MB/s | 358 kB     00:00
(50/256): dnf-4.2.23-4.el8.noarch.rpm                                                   5.8 MB/s | 512 kB     00:00
(51/256): dnf-data-4.2.23-4.el8.noarch.rpm                                              2.5 MB/s | 148 kB     00:00
(52/256): dracut-049-95.git20200804.el8.4.x86_64.rpm                                    4.1 MB/s | 367 kB     00:00
(53/256): e2fsprogs-libs-1.45.6-1.el8.x86_64.rpm                                        3.7 MB/s | 232 kB     00:00
(54/256): elfutils-default-yama-scope-0.180-1.el8.noarch.rpm                            1.5 MB/s |  47 kB     00:00
(55/256): elfutils-debuginfod-client-0.180-1.el8.x86_64.rpm                             1.1 MB/s |  63 kB     00:00
(56/256): elfutils-libelf-0.180-1.el8.x86_64.rpm                                        5.5 MB/s | 213 kB     00:00
(57/256): elfutils-libs-0.180-1.el8.x86_64.rpm                                          5.9 MB/s | 292 kB     00:00
(58/256): ethtool-5.0-2.el8.x86_64.rpm                                                  2.6 MB/s | 150 kB     00:00
(59/256): file-5.33-16.el8.1.x86_64.rpm                                                 2.4 MB/s |  75 kB     00:00
(60/256): file-libs-5.33-16.el8.1.x86_64.rpm                                            9.3 MB/s | 542 kB     00:00
(61/256): expat-2.2.5-4.el8.x86_64.rpm                                                  810 kB/s | 110 kB     00:00
(62/256): filesystem-3.8-3.el8.x86_64.rpm                                                12 MB/s | 1.1 MB     00:00
(63/256): findutils-4.6.0-20.el8.x86_64.rpm                                             5.2 MB/s | 526 kB     00:00
(64/256): fipscheck-lib-1.5.0-4.el8.x86_64.rpm                                          195 kB/s |  14 kB     00:00
(65/256): e2fsprogs-1.45.6-1.el8.x86_64.rpm                                             2.1 MB/s | 1.0 MB     00:00
(66/256): fipscheck-1.5.0-4.el8.x86_64.rpm                                              219 kB/s |  26 kB     00:00
(67/256): gdbm-1.18-1.el8.x86_64.rpm                                                    3.0 MB/s | 129 kB     00:00
(68/256): gdbm-libs-1.18-1.el8.x86_64.rpm                                               1.9 MB/s |  59 kB     00:00
(69/256): gettext-0.19.8.1-17.el8.x86_64.rpm                                             12 MB/s | 1.1 MB     00:00
(70/256): gawk-4.2.1-1.el8.x86_64.rpm                                                   4.9 MB/s | 1.1 MB     00:00
(71/256): fuse-libs-2.9.7-12.el8.x86_64.rpm                                             429 kB/s | 101 kB     00:00
(72/256): gettext-libs-0.19.8.1-17.el8.x86_64.rpm                                       4.3 MB/s | 309 kB     00:00
(73/256): glibc-2.28-127.el8.2.x86_64.rpm                                               7.4 MB/s | 3.6 MB     00:00
(74/256): glib2-2.56.4-8.el8.x86_64.rpm                                                 4.2 MB/s | 2.5 MB     00:00
(75/256): glibc-common-2.28-127.el8.2.x86_64.rpm                                        4.0 MB/s | 1.3 MB     00:00
(76/256): gmp-6.1.2-10.el8.x86_64.rpm                                                   628 kB/s | 317 kB     00:00
(77/256): gnupg2-smime-2.2.20-2.el8.x86_64.rpm                                          2.0 MB/s | 282 kB     00:00
(78/256): gnupg2-2.2.20-2.el8.x86_64.rpm                                                3.8 MB/s | 2.4 MB     00:00
(79/256): gpgme-1.13.1-3.el8.x86_64.rpm                                                 2.0 MB/s | 334 kB     00:00
(80/256): gnutls-3.6.14-8.el8.x86_64.rpm                                                2.5 MB/s | 1.0 MB     00:00
(81/256): grep-3.1-6.el8.x86_64.rpm                                                     1.9 MB/s | 272 kB     00:00
(82/256): grub2-common-2.02-90.el8.1.noarch.rpm                                         3.6 MB/s | 885 kB     00:00
(83/256): grub2-tools-minimal-2.02-90.el8.1.x86_64.rpm                                  1.6 MB/s | 205 kB     00:00
(84/256): grubby-8.40-41.el8.x86_64.rpm                                                 732 kB/s |  48 kB     00:00
(85/256): gssproxy-0.8.0-16.el8.x86_64.rpm                                              3.0 MB/s | 117 kB     00:00
(86/256): gzip-1.9-9.el8.x86_64.rpm                                                     1.0 MB/s | 165 kB     00:00
(87/256): grub2-tools-2.02-90.el8.1.x86_64.rpm                                          3.6 MB/s | 2.0 MB     00:00
(88/256): hardlink-1.3-6.el8.x86_64.rpm                                                 474 kB/s |  28 kB     00:00
(89/256): ima-evm-utils-1.1-5.el8.x86_64.rpm                                            1.4 MB/s |  54 kB     00:00
(90/256): info-6.5-6.el8.x86_64.rpm                                                     1.9 MB/s | 197 kB     00:00
(91/256): glibc-all-langpacks-2.28-127.el8.2.x86_64.rpm                                 9.8 MB/s |  25 MB     00:02
(92/256): initscripts-10.00.9-1.el8.x86_64.rpm                                          2.3 MB/s | 337 kB     00:00
(93/256): hwdata-0.314-8.6.el8.noarch.rpm                                               4.7 MB/s | 1.6 MB     00:00
(94/256): ipcalc-0.2.4-4.el8.x86_64.rpm                                                 595 kB/s |  37 kB     00:00
(95/256): iproute-5.3.0-5.el8.x86_64.rpm                                                7.5 MB/s | 664 kB     00:00
(96/256): iptables-libs-1.8.4-15.el8.3.x86_64.rpm                                       1.9 MB/s | 105 kB     00:00
(97/256): iputils-20180629-2.el8.x86_64.rpm                                             2.4 MB/s | 147 kB     00:00
(98/256): json-c-0.13.1-0.2.el8.x86_64.rpm                                              1.2 MB/s |  39 kB     00:00
(99/256): kbd-2.0.4-10.el8.x86_64.rpm                                                   5.2 MB/s | 389 kB     00:00
(100/256): kbd-legacy-2.0.4-10.el8.noarch.rpm                                           5.4 MB/s | 480 kB     00:00
(101/256): keyutils-1.5.10-6.el8.x86_64.rpm                                             1.3 MB/s |  62 kB     00:00
(102/256): keyutils-libs-1.5.10-6.el8.x86_64.rpm                                        956 kB/s |  33 kB     00:00
(103/256): kmod-25-16.el8.1.x86_64.rpm                                                  4.0 MB/s | 125 kB     00:00
(104/256): kmod-libs-25-16.el8.1.x86_64.rpm                                             2.3 MB/s |  67 kB     00:00
(105/256): kpartx-0.8.4-5.el8.x86_64.rpm                                                3.5 MB/s | 107 kB     00:00
(106/256): krb5-libs-1.18.2-5.el8.x86_64.rpm                                            9.6 MB/s | 836 kB     00:00
(107/256): less-530-1.el8.x86_64.rpm                                                    2.1 MB/s | 163 kB     00:00
(108/256): libacl-2.2.53-1.el8.x86_64.rpm                                               561 kB/s |  33 kB     00:00
(109/256): kbd-misc-2.0.4-10.el8.noarch.rpm                                             4.8 MB/s | 1.5 MB     00:00
(110/256): libarchive-3.3.2-9.el8.x86_64.rpm                                            5.1 MB/s | 357 kB     00:00
(111/256): libassuan-2.5.1-3.el8.x86_64.rpm                                             1.7 MB/s |  81 kB     00:00
(112/256): libattr-2.4.48-3.el8.x86_64.rpm                                              539 kB/s |  26 kB     00:00
(113/256): libbasicobjects-0.1.1-39.el8.x86_64.rpm                                      868 kB/s |  30 kB     00:00
(114/256): libblkid-2.32.1-24.el8.x86_64.rpm                                            5.2 MB/s | 215 kB     00:00
(115/256): libcap-2.26-4.el8.x86_64.rpm                                                 1.5 MB/s |  59 kB     00:00
(116/256): libcap-ng-0.7.9-5.el8.x86_64.rpm                                             947 kB/s |  32 kB     00:00
(117/256): libcollection-0.7.0-39.el8.x86_64.rpm                                        1.7 MB/s |  47 kB     00:00
(118/256): libcomps-0.1.11-4.el8.x86_64.rpm                                             2.7 MB/s |  80 kB     00:00
(119/256): libcom_err-1.45.6-1.el8.x86_64.rpm                                           1.4 MB/s |  48 kB     00:00
(120/256): libcurl-7.61.1-14.el8.1.x86_64.rpm                                           6.3 MB/s | 298 kB     00:00
(121/256): libcroco-0.6.12-4.el8_2.1.x86_64.rpm                                         1.3 MB/s | 112 kB     00:00
(122/256): libdb-5.3.28-39.el8.x86_64.rpm                                               8.4 MB/s | 749 kB     00:00
(123/256): libdb-utils-5.3.28-39.el8.x86_64.rpm                                         1.9 MB/s | 148 kB     00:00
(124/256): libedit-3.1-23.20170329cvs.el8.x86_64.rpm                                    1.6 MB/s | 102 kB     00:00
(125/256): libdnf-0.48.0-5.el8.x86_64.rpm                                               7.2 MB/s | 649 kB     00:00
(126/256): libevent-2.1.8-5.el8.x86_64.rpm                                              2.8 MB/s | 252 kB     00:00
(127/256): libffi-3.1-22.el8.x86_64.rpm                                                 660 kB/s |  36 kB     00:00
(128/256): libfdisk-2.32.1-24.el8.x86_64.rpm                                            3.6 MB/s | 248 kB     00:00
(129/256): libgcc-8.3.1-5.1.el8.x86_64.rpm                                              1.6 MB/s |  77 kB     00:00
(130/256): libgomp-8.3.1-5.1.el8.x86_64.rpm                                             3.0 MB/s | 203 kB     00:00
(131/256): libgcrypt-1.8.5-4.el8.x86_64.rpm                                             4.6 MB/s | 461 kB     00:00
(132/256): libgpg-error-1.31-1.el8.x86_64.rpm                                           3.7 MB/s | 240 kB     00:00
(133/256): libidn2-2.2.0-1.el8.x86_64.rpm                                               1.2 MB/s |  92 kB     00:00
(134/256): libkcapi-1.2.0-2.el8.x86_64.rpm                                              834 kB/s |  47 kB     00:00
(135/256): libini_config-1.3.1-39.el8.x86_64.rpm                                        958 kB/s |  69 kB     00:00
(136/256): libkcapi-hmaccalc-1.2.0-2.el8.x86_64.rpm                                     1.3 MB/s |  30 kB     00:00
(137/256): libksba-1.3.5-7.el8.x86_64.rpm                                               3.8 MB/s | 133 kB     00:00
(138/256): libmnl-1.0.4-6.el8.x86_64.rpm                                                1.1 MB/s |  29 kB     00:00
(139/256): libmetalink-0.1.3-7.el8.x86_64.rpm                                           948 kB/s |  31 kB     00:00
(140/256): libndp-1.7-3.el8.x86_64.rpm                                                  1.6 MB/s |  39 kB     00:00
(141/256): libmount-2.32.1-24.el8.x86_64.rpm                                            4.9 MB/s | 231 kB     00:00
(142/256): libmodulemd-2.9.4-2.el8.x86_64.rpm                                           3.7 MB/s | 188 kB     00:00
(143/256): libnghttp2-1.33.0-3.el8_3.1.x86_64.rpm                                       1.5 MB/s |  76 kB     00:00
(144/256): libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64.rpm                            1.0 MB/s |  56 kB     00:00
(145/256): libnfsidmap-2.3.3-35.el8.x86_64.rpm                                          1.4 MB/s | 118 kB     00:00
(146/256): libpath_utils-0.2.1-39.el8.x86_64.rpm                                        1.0 MB/s |  33 kB     00:00
(147/256): libpsl-0.20.2-6.el8.x86_64.rpm                                               1.9 MB/s |  60 kB     00:00
(148/256): libpcap-1.9.1-4.el8.x86_64.rpm                                               3.5 MB/s | 165 kB     00:00
(149/256): libpwquality-1.4.0-9.el8.x86_64.rpm                                          1.5 MB/s | 101 kB     00:00
(150/256): libref_array-0.1.5-39.el8.x86_64.rpm                                         564 kB/s |  32 kB     00:00
(151/256): librepo-1.12.0-2.el8.x86_64.rpm                                              1.7 MB/s |  89 kB     00:00
(152/256): libreport-filesystem-2.9.5-15.el8.rocky.x86_64.rpm                           721 kB/s |  20 kB     00:00
(153/256): libseccomp-2.4.3-1.el8.x86_64.rpm                                            2.2 MB/s |  66 kB     00:00
(154/256): libsecret-0.18.6-1.el8.x86_64.rpm                                            4.6 MB/s | 162 kB     00:00
(155/256): libselinux-2.9-4.el8_3.x86_64.rpm                                            2.9 MB/s | 164 kB     00:00
(156/256): libselinux-utils-2.9-4.el8_3.x86_64.rpm                                      3.6 MB/s | 242 kB     00:00
(157/256): libsemanage-2.9-3.el8.x86_64.rpm                                             2.3 MB/s | 164 kB     00:00
(158/256): libsigsegv-2.11-5.el8.x86_64.rpm                                             397 kB/s |  29 kB     00:00
(159/256): libsepol-2.9-1.el8.x86_64.rpm                                                3.8 MB/s | 338 kB     00:00
(160/256): libsmartcols-2.32.1-24.el8.x86_64.rpm                                        2.4 MB/s | 174 kB     00:00
(161/256): libss-1.45.6-1.el8.x86_64.rpm                                                1.3 MB/s |  52 kB     00:00
(162/256): libssh-0.9.4-2.el8.x86_64.rpm                                                2.9 MB/s | 213 kB     00:00
(163/256): libsolv-0.7.11-1.el8.x86_64.rpm                                              4.1 MB/s | 357 kB     00:00
(164/256): libssh-config-0.9.4-2.el8.noarch.rpm                                         399 kB/s |  17 kB     00:00
(165/256): libtasn1-4.13-3.el8.x86_64.rpm                                               1.7 MB/s |  75 kB     00:00
(166/256): libtirpc-1.1.4-4.el8.x86_64.rpm                                              2.6 MB/s | 111 kB     00:00
(167/256): libstdc++-8.3.1-5.1.el8.x86_64.rpm                                           6.0 MB/s | 450 kB     00:00
(168/256): libusbx-1.0.23-4.el8.x86_64.rpm                                              1.3 MB/s |  73 kB     00:00
(169/256): libunistring-0.9.9-3.el8.x86_64.rpm                                          4.8 MB/s | 419 kB     00:00
(170/256): libutempter-1.1.6-14.el8.x86_64.rpm                                          510 kB/s |  31 kB     00:00
(171/256): libuuid-2.32.1-24.el8.x86_64.rpm                                             2.6 MB/s |  94 kB     00:00
(172/256): libverto-libevent-0.3.0-5.el8.x86_64.rpm                                     258 kB/s |  15 kB     00:00
(173/256): libxcrypt-4.1.1-4.el8.x86_64.rpm                                             1.3 MB/s |  71 kB     00:00
(174/256): libyaml-0.1.7-5.el8.x86_64.rpm                                               1.8 MB/s |  60 kB     00:00
(175/256): libxml2-2.9.7-8.el8.x86_64.rpm                                                11 MB/s | 695 kB     00:00
(176/256): libverto-0.3.0-5.el8.x86_64.rpm                                              165 kB/s |  23 kB     00:00
(177/256): logrotate-3.14.0-4.el8.x86_64.rpm                                            1.8 MB/s |  85 kB     00:00
(178/256): libzstd-1.4.4-1.el8.x86_64.rpm                                               3.4 MB/s | 265 kB     00:00
(179/256): lua-libs-5.3.4-11.el8.x86_64.rpm                                             3.3 MB/s | 117 kB     00:00
(180/256): memstrack-0.1.11-1.el8.x86_64.rpm                                            827 kB/s |  46 kB     00:00
(181/256): lz4-libs-1.8.3-2.el8.x86_64.rpm                                              981 kB/s |  65 kB     00:00
(182/256): mpfr-3.1.6-1.el8.x86_64.rpm                                                  2.8 MB/s | 219 kB     00:00
(183/256): ncurses-base-6.1-7.20180224.el8.noarch.rpm                                   2.4 MB/s |  80 kB     00:00
(184/256): ncurses-6.1-7.20180224.el8.x86_64.rpm                                        7.7 MB/s | 386 kB     00:00
(185/256): ncurses-libs-6.1-7.20180224.el8.x86_64.rpm                                   5.5 MB/s | 332 kB     00:00
(186/256): net-tools-2.0-0.52.20160912git.el8.x86_64.rpm                                4.2 MB/s | 321 kB     00:00
(187/256): nettle-3.4.1-2.el8.x86_64.rpm                                                4.1 MB/s | 299 kB     00:00
(188/256): npth-1.5-4.el8.x86_64.rpm                                                    749 kB/s |  25 kB     00:00
(189/256): nfs-utils-2.3.3-35.el8.x86_64.rpm                                            4.4 MB/s | 493 kB     00:00
(190/256): openldap-2.4.46-15.el8.x86_64.rpm                                            3.6 MB/s | 350 kB     00:00
(191/256): openssh-8.0p1-5.el8.x86_64.rpm                                               5.3 MB/s | 520 kB     00:00
(192/256): openssh-server-8.0p1-5.el8.x86_64.rpm                                        4.6 MB/s | 482 kB     00:00
(193/256): openssh-clients-8.0p1-5.el8.x86_64.rpm                                       4.5 MB/s | 666 kB     00:00
(194/256): openssl-1.1.1g-15.el8.x86_64.rpm                                             4.9 MB/s | 706 kB     00:00
(195/256): openssl-pkcs11-0.4.10-2.el8.x86_64.rpm                                       1.4 MB/s |  65 kB     00:00
(196/256): os-prober-1.74-6.el8.x86_64.rpm                                              1.1 MB/s |  50 kB     00:00
(197/256): p11-kit-0.23.14-5.el8_0.x86_64.rpm                                           5.7 MB/s | 272 kB     00:00
(198/256): p11-kit-trust-0.23.14-5.el8_0.x86_64.rpm                                     2.0 MB/s | 137 kB     00:00
(199/256): pam-1.3.1-11.el8.x86_64.rpm                                                  6.4 MB/s | 737 kB     00:00
(200/256): openssl-libs-1.1.1g-15.el8.x86_64.rpm                                        5.2 MB/s | 1.5 MB     00:00
(201/256): pciutils-3.6.4-2.el8.x86_64.rpm                                              932 kB/s | 101 kB     00:00
(202/256): pciutils-libs-3.6.4-2.el8.x86_64.rpm                                         876 kB/s |  53 kB     00:00
(203/256): pigz-2.4-4.el8.x86_64.rpm                                                    1.9 MB/s |  78 kB     00:00
(204/256): pcre-8.42-4.el8.x86_64.rpm                                                   3.5 MB/s | 209 kB     00:00
(205/256): pcre2-10.32-2.el8.x86_64.rpm                                                 3.9 MB/s | 245 kB     00:00
(206/256): platform-python-3.6.8-31.el8.x86_64.rpm                                      1.5 MB/s |  82 kB     00:00
(207/256): platform-python-setuptools-39.2.0-6.el8.noarch.rpm                           7.1 MB/s | 630 kB     00:00
(208/256): policycoreutils-2.9-9.el8.x86_64.rpm                                         5.3 MB/s | 376 kB     00:00
(209/256): popt-1.16-14.el8.x86_64.rpm                                                  996 kB/s |  60 kB     00:00
(210/256): polkit-libs-0.115-11.el8.x86_64.rpm                                          818 kB/s |  75 kB     00:00
(211/256): platform-python-pip-9.0.3-18.el8.noarch.rpm                                  6.8 MB/s | 1.7 MB     00:00
(212/256): psmisc-23.1-5.el8.x86_64.rpm                                                 2.0 MB/s | 150 kB     00:00
(213/256): python3-dbus-1.2.4-15.el8.x86_64.rpm                                         2.2 MB/s | 133 kB     00:00
(214/256): procps-ng-3.3.15-3.el8.x86_64.rpm                                            2.0 MB/s | 327 kB     00:00
(215/256): python3-dnf-4.2.23-4.el8.noarch.rpm                                          6.4 MB/s | 525 kB     00:00
(216/256): publicsuffix-list-dafsa-20180723-1.el8.noarch.rpm                            380 kB/s |  55 kB     00:00
(217/256): python3-gpg-1.13.1-3.el8.x86_64.rpm                                          3.2 MB/s | 243 kB     00:00
(218/256): python3-libcomps-0.1.11-4.el8.x86_64.rpm                                     1.2 MB/s |  51 kB     00:00
(219/256): python3-hawkey-0.48.0-5.el8.x86_64.rpm                                       2.4 MB/s | 110 kB     00:00
(220/256): python3-libdnf-0.48.0-5.el8.x86_64.rpm                                        10 MB/s | 755 kB     00:00
(221/256): python3-pip-wheel-9.0.3-18.el8.noarch.rpm                                    5.4 MB/s | 1.0 MB     00:00
(222/256): python3-pyyaml-3.12-12.el8.x86_64.rpm                                        1.2 MB/s | 192 kB     00:00
(223/256): python3-setuptools-wheel-39.2.0-6.el8.noarch.rpm                             1.8 MB/s | 286 kB     00:00
(224/256): python3-rpm-4.14.3-4.el8.x86_64.rpm                                          935 kB/s | 156 kB     00:00
(225/256): quota-nls-4.04-10.el8.noarch.rpm                                             745 kB/s |  93 kB     00:00
(226/256): quota-4.04-10.el8.x86_64.rpm                                                 1.6 MB/s | 212 kB     00:00
(227/256): python3-libs-3.6.8-31.el8.x86_64.rpm                                          13 MB/s | 7.8 MB     00:00
(228/256): rpcbind-1.2.5-7.el8.x86_64.rpm                                               542 kB/s |  69 kB     00:00
(229/256): readline-7.0-10.el8.x86_64.rpm                                               1.5 MB/s | 198 kB     00:00
(230/256): rpm-build-libs-4.14.3-4.el8.x86_64.rpm                                       2.7 MB/s | 153 kB     00:00
(231/256): rpm-4.14.3-4.el8.x86_64.rpm                                                  7.6 MB/s | 540 kB     00:00
(232/256): rpm-libs-4.14.3-4.el8.x86_64.rpm                                             4.3 MB/s | 337 kB     00:00
(233/256): rpm-plugin-systemd-inhibit-4.14.3-4.el8.x86_64.rpm                           821 kB/s |  75 kB     00:00
(234/256): rsync-3.1.3-9.el8.x86_64.rpm                                                 3.4 MB/s | 403 kB     00:00
(235/256): setup-2.12.2-6.el8.noarch.rpm                                                2.4 MB/s | 180 kB     00:00
(236/256): shadow-utils-4.6-11.el8.x86_64.rpm                                           8.8 MB/s | 1.2 MB     00:00
(237/256): sed-4.5-2.el8.x86_64.rpm                                                     1.1 MB/s | 297 kB     00:00
(238/256): shared-mime-info-1.9-3.el8.x86_64.rpm                                        2.4 MB/s | 328 kB     00:00
(239/256): sqlite-libs-3.26.0-11.el8.x86_64.rpm                                         5.7 MB/s | 579 kB     00:00
(240/256): sudo-1.8.29-6.el8.1.x86_64.rpm                                               8.7 MB/s | 922 kB     00:00
(241/256): strace-5.1-1.el8.x86_64.rpm                                                  3.6 MB/s | 1.0 MB     00:00
(242/256): systemd-239-41.el8.2.x86_64.rpm                                               10 MB/s | 3.5 MB     00:00
(243/256): systemd-libs-239-41.el8.2.x86_64.rpm                                         3.2 MB/s | 1.1 MB     00:00
(244/256): systemd-pam-239-41.el8.2.x86_64.rpm                                          2.4 MB/s | 455 kB     00:00
(245/256): systemd-udev-239-41.el8.2.x86_64.rpm                                          11 MB/s | 1.3 MB     00:00
(246/256): tar-1.30-5.el8.x86_64.rpm                                                    6.8 MB/s | 837 kB     00:00
(247/256): trousers-lib-0.3.14-4.el8.x86_64.rpm                                         2.2 MB/s | 166 kB     00:00
(248/256): trousers-0.3.14-4.el8.x86_64.rpm                                             991 kB/s | 151 kB     00:00
(249/256): tzdata-2021a-1.el8.noarch.rpm                                                7.2 MB/s | 472 kB     00:00
(250/256): which-2.21-12.el8.x86_64.rpm                                                 864 kB/s |  48 kB     00:00
(251/256): vim-minimal-8.0.1763-15.el8.x86_64.rpm                                       5.8 MB/s | 572 kB     00:00
(252/256): xz-5.2.4-3.el8.x86_64.rpm                                                    2.8 MB/s | 152 kB     00:00
(253/256): xz-libs-5.2.4-3.el8.x86_64.rpm                                               3.0 MB/s |  93 kB     00:00
(254/256): zlib-1.2.11-16.2.el8.x86_64.rpm                                              2.4 MB/s | 101 kB     00:00
(255/256): util-linux-2.32.1-24.el8.x86_64.rpm                                          6.5 MB/s | 2.5 MB     00:00
(256/256): words-3.0-28.el8.noarch.rpm                                                  3.8 MB/s | 1.4 MB     00:00
------------------------------------------------------------------------------------------------------------------------
Total                                                                                    13 MB/s | 151 MB     00:11
warning: /home/vagrant/chroots/rocky8/rootfs/var/cache/dnf/appstream-2a9346f6e08884f6/packages/geolite2-city-20180605-1.el8.noarch.rpm: Header V4 RSA/SHA256 Signature, key ID 6d745a60: NOKEY
Rocky Linux 8 - AppStream                                                               258 kB/s | 1.6 kB     00:00
Importing GPG key 0x6D745A60:
 Userid     : "Release Engineering <infrastructure@rockylinux.org>"
 Fingerprint: 7051 C470 A929 F454 CEBE 37B7 15AF 5DAC 6D74 5A60
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Running scriptlet: filesystem-3.8-3.el8.x86_64                                                                    1/1
  Preparing        :                                                                                                1/1
  Installing       : libgcc-8.3.1-5.1.el8.x86_64                                                                  1/256
  Running scriptlet: libgcc-8.3.1-5.1.el8.x86_64                                                                  1/256
  Installing       : setup-2.12.2-6.el8.noarch                                                                    2/256
  Running scriptlet: setup-2.12.2-6.el8.noarch                                                                    2/256
  Installing       : filesystem-3.8-3.el8.x86_64                                                                  3/256
  Installing       : python3-setuptools-wheel-39.2.0-6.el8.noarch                                                 4/256
  Installing       : python3-pip-wheel-9.0.3-18.el8.noarch                                                        5/256
  Installing       : geolite2-country-20180605-1.el8.noarch                                                       6/256
  Installing       : geolite2-city-20180605-1.el8.noarch                                                          7/256
  Installing       : basesystem-11-5.el8.noarch                                                                   8/256
  Installing       : tzdata-2021a-1.el8.noarch                                                                    9/256
  Installing       : quota-nls-1:4.04-10.el8.noarch                                                              10/256
  Installing       : publicsuffix-list-dafsa-20180723-1.el8.noarch                                               11/256
  Installing       : ncurses-base-6.1-7.20180224.el8.noarch                                                      12/256
  Installing       : pcre2-10.32-2.el8.x86_64                                                                    13/256
  Installing       : libselinux-2.9-4.el8_3.x86_64                                                               14/256
  Installing       : ncurses-libs-6.1-7.20180224.el8.x86_64                                                      15/256
  Installing       : glibc-all-langpacks-2.28-127.el8.2.x86_64                                                   16/256
  Installing       : glibc-common-2.28-127.el8.2.x86_64                                                          17/256
  Running scriptlet: glibc-2.28-127.el8.2.x86_64                                                                 18/256
  Installing       : glibc-2.28-127.el8.2.x86_64                                                                 18/256
  Running scriptlet: glibc-2.28-127.el8.2.x86_64                                                                 18/256
  Installing       : bash-4.4.19-12.el8.x86_64                                                                   19/256
  Running scriptlet: bash-4.4.19-12.el8.x86_64                                                                   19/256
  Installing       : libsepol-2.9-1.el8.x86_64                                                                   20/256
  Running scriptlet: libsepol-2.9-1.el8.x86_64                                                                   20/256
  Installing       : zlib-1.2.11-16.2.el8.x86_64                                                                 21/256
  Installing       : xz-libs-5.2.4-3.el8.x86_64                                                                  22/256
  Installing       : libcom_err-1.45.6-1.el8.x86_64                                                              23/256
  Running scriptlet: libcom_err-1.45.6-1.el8.x86_64                                                              23/256
  Installing       : info-6.5-6.el8.x86_64                                                                       24/256
  Installing       : libcap-2.26-4.el8.x86_64                                                                    25/256
  Installing       : libgpg-error-1.31-1.el8.x86_64                                                              26/256
  Installing       : bzip2-libs-1.0.6-26.el8.x86_64                                                              27/256
  Installing       : libxml2-2.9.7-8.el8.x86_64                                                                  28/256
  Installing       : libuuid-2.32.1-24.el8.x86_64                                                                29/256
  Running scriptlet: libuuid-2.32.1-24.el8.x86_64                                                                29/256
  Installing       : popt-1.16-14.el8.x86_64                                                                     30/256
  Installing       : elfutils-libelf-0.180-1.el8.x86_64                                                          31/256
  Installing       : libxcrypt-4.1.1-4.el8.x86_64                                                                32/256
  Installing       : expat-2.2.5-4.el8.x86_64                                                                    33/256
  Installing       : readline-7.0-10.el8.x86_64                                                                  34/256
  Running scriptlet: readline-7.0-10.el8.x86_64                                                                  34/256
install-info: No such file or directory for /dev/null
install-info: No such file or directory for /dev/null

  Installing       : chkconfig-1.13-2.el8.x86_64                                                                 35/256
  Installing       : sqlite-libs-3.26.0-11.el8.x86_64                                                            36/256
  Installing       : libgcrypt-1.8.5-4.el8.x86_64                                                                37/256
  Running scriptlet: libgcrypt-1.8.5-4.el8.x86_64                                                                37/256
  Installing       : libunistring-0.9.9-3.el8.x86_64                                                             38/256
  Installing       : libidn2-2.2.0-1.el8.x86_64                                                                  39/256
  Installing       : gmp-1:6.1.2-10.el8.x86_64                                                                   40/256
  Running scriptlet: gmp-1:6.1.2-10.el8.x86_64                                                                   40/256
  Installing       : keyutils-libs-1.5.10-6.el8.x86_64                                                           41/256
  Installing       : libattr-2.4.48-3.el8.x86_64                                                                 42/256
  Installing       : libacl-2.2.53-1.el8.x86_64                                                                  43/256
  Installing       : sed-4.5-2.el8.x86_64                                                                        44/256
  Running scriptlet: sed-4.5-2.el8.x86_64                                                                        44/256
install-info: No such file or directory for /dev/null

  Installing       : libzstd-1.4.4-1.el8.x86_64                                                                  45/256
  Installing       : lua-libs-5.3.4-11.el8.x86_64                                                                46/256
  Installing       : libassuan-2.5.1-3.el8.x86_64                                                                47/256
  Installing       : file-libs-5.33-16.el8.1.x86_64                                                              48/256
  Installing       : json-c-0.13.1-0.2.el8.x86_64                                                                49/256
  Installing       : libcap-ng-0.7.9-5.el8.x86_64                                                                50/256
  Installing       : audit-libs-3.0-0.17.20191104git1c2f876.el8.x86_64                                           51/256
  Installing       : libffi-3.1-22.el8.x86_64                                                                    52/256
  Installing       : p11-kit-0.23.14-5.el8_0.x86_64                                                              53/256
  Running scriptlet: p11-kit-0.23.14-5.el8_0.x86_64                                                              53/256
  Installing       : libsmartcols-2.32.1-24.el8.x86_64                                                           54/256
  Running scriptlet: libsmartcols-2.32.1-24.el8.x86_64                                                           54/256
  Installing       : libstdc++-8.3.1-5.1.el8.x86_64                                                              55/256
  Running scriptlet: libstdc++-8.3.1-5.1.el8.x86_64                                                              55/256
  Installing       : findutils-1:4.6.0-20.el8.x86_64                                                             56/256
  Running scriptlet: findutils-1:4.6.0-20.el8.x86_64                                                             56/256
  Installing       : libverto-0.3.0-5.el8.x86_64                                                                 57/256
  Installing       : lz4-libs-1.8.3-2.el8.x86_64                                                                 58/256
  Installing       : libsemanage-2.9-3.el8.x86_64                                                                59/256
  Installing       : nettle-3.4.1-2.el8.x86_64                                                                   60/256
  Running scriptlet: nettle-3.4.1-2.el8.x86_64                                                                   60/256
  Installing       : libpsl-0.20.2-6.el8.x86_64                                                                  61/256
  Installing       : libmetalink-0.1.3-7.el8.x86_64                                                              62/256
  Installing       : libksba-1.3.5-7.el8.x86_64                                                                  63/256
  Installing       : diffutils-3.6-6.el8.x86_64                                                                  64/256
  Running scriptlet: diffutils-3.6-6.el8.x86_64                                                                  64/256
  Installing       : libgomp-8.3.1-5.1.el8.x86_64                                                                65/256
  Running scriptlet: libgomp-8.3.1-5.1.el8.x86_64                                                                65/256
  Installing       : e2fsprogs-libs-1.45.6-1.el8.x86_64                                                          66/256
  Running scriptlet: e2fsprogs-libs-1.45.6-1.el8.x86_64                                                          66/256
  Installing       : grub2-common-1:2.02-90.el8.1.noarch                                                         67/256
  Installing       : gdbm-libs-1:1.18-1.el8.x86_64                                                               68/256
  Installing       : libbasicobjects-0.1.1-39.el8.x86_64                                                         69/256
  Installing       : libcollection-0.7.0-39.el8.x86_64                                                           70/256
  Installing       : libref_array-0.1.5-39.el8.x86_64                                                            71/256
  Installing       : libtasn1-4.13-3.el8.x86_64                                                                  72/256
  Running scriptlet: libtasn1-4.13-3.el8.x86_64                                                                  72/256
  Installing       : p11-kit-trust-0.23.14-5.el8_0.x86_64                                                        73/256
  Running scriptlet: p11-kit-trust-0.23.14-5.el8_0.x86_64                                                        73/256
  Installing       : libyaml-0.1.7-5.el8.x86_64                                                                  74/256
  Installing       : pcre-8.42-4.el8.x86_64                                                                      75/256
  Installing       : grep-3.1-6.el8.x86_64                                                                       76/256
  Running scriptlet: grep-3.1-6.el8.x86_64                                                                       76/256
  Installing       : xz-5.2.4-3.el8.x86_64                                                                       77/256
  Installing       : gdbm-1:1.18-1.el8.x86_64                                                                    78/256
  Installing       : file-5.33-16.el8.1.x86_64                                                                   79/256
  Installing       : acl-2.2.53-1.el8.x86_64                                                                     80/256
  Installing       : vim-minimal-2:8.0.1763-15.el8.x86_64                                                        81/256
  Installing       : keyutils-1.5.10-6.el8.x86_64                                                                82/256
  Installing       : mpfr-3.1.6-1.el8.x86_64                                                                     83/256
  Running scriptlet: mpfr-3.1.6-1.el8.x86_64                                                                     83/256
  Installing       : libcomps-0.1.11-4.el8.x86_64                                                                84/256
  Installing       : coreutils-common-8.30-8.el8.x86_64                                                          85/256
  Running scriptlet: coreutils-common-8.30-8.el8.x86_64                                                          85/256
  Installing       : libss-1.45.6-1.el8.x86_64                                                                   86/256
  Running scriptlet: libss-1.45.6-1.el8.x86_64                                                                   86/256
  Installing       : pigz-2.4-4.el8.x86_64                                                                       87/256
  Installing       : libselinux-utils-2.9-4.el8_3.x86_64                                                         88/256
  Installing       : libestr-0.1.10-1.el8.x86_64                                                                 89/256
  Running scriptlet: libestr-0.1.10-1.el8.x86_64                                                                 89/256
  Installing       : libfastjson-0.99.8-2.el8.x86_64                                                             90/256
  Running scriptlet: libfastjson-0.99.8-2.el8.x86_64                                                             90/256
  Installing       : libmaxminddb-1.2.0-10.el8.x86_64                                                            91/256
  Running scriptlet: libmaxminddb-1.2.0-10.el8.x86_64                                                            91/256
  Installing       : ipcalc-0.2.4-4.el8.x86_64                                                                   92/256
  Installing       : brotli-1.0.6-2.el8.x86_64                                                                   93/256
  Installing       : cpio-2.12-8.el8.x86_64                                                                      94/256
  Installing       : fuse-libs-2.9.7-12.el8.x86_64                                                               95/256
  Running scriptlet: fuse-libs-2.9.7-12.el8.x86_64                                                               95/256
  Installing       : hardlink-1:1.3-6.el8.x86_64                                                                 96/256
  Installing       : libedit-3.1-23.20170329cvs.el8.x86_64                                                       97/256
  Installing       : libmnl-1.0.4-6.el8.x86_64                                                                   98/256
  Running scriptlet: libmnl-1.0.4-6.el8.x86_64                                                                   98/256
  Installing       : libndp-1.7-3.el8.x86_64                                                                     99/256
  Running scriptlet: libndp-1.7-3.el8.x86_64                                                                     99/256
  Installing       : libnghttp2-1.33.0-3.el8_3.1.x86_64                                                         100/256
  Installing       : libpath_utils-0.2.1-39.el8.x86_64                                                          101/256
  Installing       : libini_config-1.3.1-39.el8.x86_64                                                          102/256
  Installing       : libpcap-14:1.9.1-4.el8.x86_64                                                              103/256
  Installing       : iptables-libs-1.8.4-15.el8.3.x86_64                                                        104/256
  Installing       : libseccomp-2.4.3-1.el8.x86_64                                                              105/256
  Running scriptlet: libseccomp-2.4.3-1.el8.x86_64                                                              105/256
  Installing       : libsigsegv-2.11-5.el8.x86_64                                                               106/256
  Installing       : gawk-4.2.1-1.el8.x86_64                                                                    107/256
  Installing       : memstrack-0.1.11-1.el8.x86_64                                                              108/256
  Installing       : ncurses-6.1-7.20180224.el8.x86_64                                                          109/256
  Installing       : npth-1.5-4.el8.x86_64                                                                      110/256
  Installing       : pciutils-libs-3.6.4-2.el8.x86_64                                                           111/256
  Running scriptlet: pciutils-libs-3.6.4-2.el8.x86_64                                                           111/256
  Installing       : which-2.21-12.el8.x86_64                                                                   112/256
  Installing       : libssh-config-0.9.4-2.el8.noarch                                                           113/256
  Installing       : libreport-filesystem-2.9.5-15.el8.rocky.x86_64                                             114/256
  Installing       : dnf-data-4.2.23-4.el8.noarch                                                               115/256
  Installing       : kbd-misc-2.0.4-10.el8.noarch                                                               116/256
  Installing       : kbd-legacy-2.0.4-10.el8.noarch                                                             117/256
  Installing       : hwdata-0.314-8.6.el8.noarch                                                                118/256
  Installing       : dhcp-common-12:4.3.6-41.el8.noarch                                                         119/256
  Installing       : dbus-common-1:1.12.8-12.el8.noarch                                                         120/256
  Installing       : xkeyboard-config-2.28-1.el8.noarch                                                         121/256
  Installing       : libxkbcommon-0.9.1-1.el8.x86_64                                                            122/256
  Installing       : cyrus-sasl-lib-2.1.27-5.el8.x86_64                                                         123/256
  Running scriptlet: cyrus-sasl-lib-2.1.27-5.el8.x86_64                                                         123/256
  Installing       : platform-python-pip-9.0.3-18.el8.noarch                                                    124/256
  Installing       : platform-python-setuptools-39.2.0-6.el8.noarch                                             125/256
  Installing       : python3-libs-3.6.8-31.el8.x86_64                                                           126/256
  Installing       : grub2-tools-minimal-1:2.02-90.el8.1.x86_64                                                 127/256
  Installing       : libssh-0.9.4-2.el8.x86_64                                                                  128/256
  Installing       : openldap-2.4.46-15.el8.x86_64                                                              129/256
  Installing       : platform-python-3.6.8-31.el8.x86_64                                                        130/256
  Running scriptlet: platform-python-3.6.8-31.el8.x86_64                                                        130/256
  Installing       : grubby-8.40-41.el8.x86_64                                                                  131/256
  Installing       : libkcapi-1.2.0-2.el8.x86_64                                                                132/256
  Installing       : libkcapi-hmaccalc-1.2.0-2.el8.x86_64                                                       133/256
  Installing       : libarchive-3.3.2-9.el8.x86_64                                                              134/256
  Installing       : libdb-utils-5.3.28-39.el8.x86_64                                                           135/256
  Installing       : curl-7.61.1-14.el8.1.x86_64                                                                136/256
  Installing       : libcurl-7.61.1-14.el8.1.x86_64                                                             137/256
  Installing       : openssl-1:1.1.1g-15.el8.x86_64                                                             138/256
  Installing       : crypto-policies-scripts-20210209-1.gitbfb6bed.el8.noarch                                   139/256
  Installing       : crypto-policies-20210209-1.gitbfb6bed.el8.noarch                                           140/256
  Running scriptlet: crypto-policies-20210209-1.gitbfb6bed.el8.noarch                                           140/256
  Installing       : elfutils-default-yama-scope-0.180-1.el8.noarch                                             141/256
  Running scriptlet: elfutils-default-yama-scope-0.180-1.el8.noarch                                             141/256
  Installing       : gzip-1.9-9.el8.x86_64                                                                      142/256
  Running scriptlet: gzip-1.9-9.el8.x86_64                                                                      142/256
  Installing       : cracklib-2.9.6-15.el8.x86_64                                                               143/256
  Installing       : cracklib-dicts-2.9.6-15.el8.x86_64                                                         144/256
  Installing       : procps-ng-3.3.15-3.el8.x86_64                                                              145/256
  Installing       : krb5-libs-1.18.2-5.el8.x86_64                                                              146/256
  Installing       : libtirpc-1.1.4-4.el8.x86_64                                                                147/256
  Running scriptlet: libtirpc-1.1.4-4.el8.x86_64                                                                147/256
  Installing       : libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64                                              148/256
  Running scriptlet: libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64                                              148/256
  Installing       : kpartx-0.8.4-5.el8.x86_64                                                                  149/256
  Installing       : device-mapper-8:1.02.171-5.el8.2.x86_64                                                    150/256
  Installing       : elfutils-debuginfod-client-0.180-1.el8.x86_64                                              151/256
  Installing       : elfutils-libs-0.180-1.el8.x86_64                                                           152/256
  Installing       : openssl-pkcs11-0.4.10-2.el8.x86_64                                                         153/256
  Installing       : rpm-4.14.3-4.el8.x86_64                                                                    154/256
  Installing       : gettext-libs-0.19.8.1-17.el8.x86_64                                                        155/256
  Installing       : libcroco-0.6.12-4.el8_2.1.x86_64                                                           156/256
  Running scriptlet: libcroco-0.6.12-4.el8_2.1.x86_64                                                           156/256
  Installing       : libfdisk-2.32.1-24.el8.x86_64                                                              157/256
  Running scriptlet: libfdisk-2.32.1-24.el8.x86_64                                                              157/256
  Installing       : libmount-2.32.1-24.el8.x86_64                                                              158/256
  Running scriptlet: libmount-2.32.1-24.el8.x86_64                                                              158/256
  Installing       : dbus-libs-1:1.12.8-12.el8.x86_64                                                           159/256
  Running scriptlet: dbus-libs-1:1.12.8-12.el8.x86_64                                                           159/256
  Installing       : dbus-tools-1:1.12.8-12.el8.x86_64                                                          160/256
  Installing       : coreutils-8.30-8.el8.x86_64                                                                161/256
  Installing       : systemd-libs-239-41.el8.2.x86_64                                                           162/256
  Running scriptlet: systemd-libs-239-41.el8.2.x86_64                                                           162/256
  Installing       : libblkid-2.32.1-24.el8.x86_64                                                              163/256
  Running scriptlet: libblkid-2.32.1-24.el8.x86_64                                                              163/256
  Installing       : shadow-utils-2:4.6-11.el8.x86_64                                                           164/256
  Installing       : device-mapper-libs-8:1.02.171-5.el8.2.x86_64                                               165/256
  Running scriptlet: ca-certificates-2020.2.41-80.0.el8_2.noarch                                                166/256
  Installing       : ca-certificates-2020.2.41-80.0.el8_2.noarch                                                166/256
  Running scriptlet: ca-certificates-2020.2.41-80.0.el8_2.noarch                                                166/256
  Installing       : openssl-libs-1:1.1.1g-15.el8.x86_64                                                        167/256
  Running scriptlet: openssl-libs-1:1.1.1g-15.el8.x86_64                                                        167/256
  Installing       : libdb-5.3.28-39.el8.x86_64                                                                 168/256
  Running scriptlet: libdb-5.3.28-39.el8.x86_64                                                                 168/256
  Installing       : rpm-libs-4.14.3-4.el8.x86_64                                                               169/256
  Running scriptlet: rpm-libs-4.14.3-4.el8.x86_64                                                               169/256
  Installing       : kmod-25-16.el8.1.x86_64                                                                    170/256
  Installing       : kmod-libs-25-16.el8.1.x86_64                                                               171/256
  Running scriptlet: kmod-libs-25-16.el8.1.x86_64                                                               171/256
  Installing       : cryptsetup-libs-2.3.3-2.el8.x86_64                                                         172/256
  Running scriptlet: cryptsetup-libs-2.3.3-2.el8.x86_64                                                         172/256
  Installing       : trousers-lib-0.3.14-4.el8.x86_64                                                           173/256
  Running scriptlet: trousers-lib-0.3.14-4.el8.x86_64                                                           173/256
  Running scriptlet: dbus-daemon-1:1.12.8-12.el8.x86_64                                                         174/256
  Installing       : dbus-daemon-1:1.12.8-12.el8.x86_64                                                         174/256
  Running scriptlet: dbus-daemon-1:1.12.8-12.el8.x86_64                                                         174/256
  Running scriptlet: libutempter-1.1.6-14.el8.x86_64                                                            175/256
  Installing       : libutempter-1.1.6-14.el8.x86_64                                                            175/256
  Installing       : kbd-2.0.4-10.el8.x86_64                                                                    176/256
  Installing       : libpwquality-1.4.0-9.el8.x86_64                                                            177/256
  Installing       : pam-1.3.1-11.el8.x86_64                                                                    178/256
  Running scriptlet: pam-1.3.1-11.el8.x86_64                                                                    178/256
  Installing       : util-linux-2.32.1-24.el8.x86_64                                                            179/256
  Running scriptlet: util-linux-2.32.1-24.el8.x86_64                                                            179/256
  Installing       : systemd-pam-239-41.el8.2.x86_64                                                            180/256
  Installing       : dracut-049-95.git20200804.el8.4.x86_64                                                     181/256
  Installing       : os-prober-1.74-6.el8.x86_64                                                                182/256
  Installing       : gettext-0.19.8.1-17.el8.x86_64                                                             183/256
  Running scriptlet: gettext-0.19.8.1-17.el8.x86_64                                                             183/256
  Running scriptlet: grub2-tools-1:2.02-90.el8.1.x86_64                                                         184/256
  Installing       : grub2-tools-1:2.02-90.el8.1.x86_64                                                         184/256
  Running scriptlet: grub2-tools-1:2.02-90.el8.1.x86_64                                                         184/256
  Installing       : glib2-2.56.4-8.el8.x86_64                                                                  185/256
  Installing       : shared-mime-info-1.9-3.el8.x86_64                                                          186/256
  Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                                                          186/256
  Installing       : gnutls-3.6.14-8.el8.x86_64                                                                 187/256
  Installing       : dbus-1:1.12.8-12.el8.x86_64                                                                188/256
  Running scriptlet: systemd-239-41.el8.2.x86_64                                                                189/256
  Installing       : systemd-239-41.el8.2.x86_64                                                                189/256
  Running scriptlet: systemd-239-41.el8.2.x86_64                                                                189/256
  Installing       : systemd-udev-239-41.el8.2.x86_64                                                           190/256
  Running scriptlet: systemd-udev-239-41.el8.2.x86_64                                                           190/256
Failed to open /dev/urandom: No such file or directory

  Running scriptlet: trousers-0.3.14-4.el8.x86_64                                                               191/256
  Installing       : trousers-0.3.14-4.el8.x86_64                                                               191/256
  Running scriptlet: trousers-0.3.14-4.el8.x86_64                                                               191/256
  Installing       : libmodulemd-2.9.4-2.el8.x86_64                                                             192/256
  Installing       : libevent-2.1.8-5.el8.x86_64                                                                193/256
  Installing       : libsolv-0.7.11-1.el8.x86_64                                                                194/256
  Installing       : crontabs-1.11-16.20150630git.el8.noarch                                                    195/256
  Installing       : cronie-1.5.2-4.el8.x86_64                                                                  196/256
  Running scriptlet: cronie-1.5.2-4.el8.x86_64                                                                  196/256
  Installing       : cronie-anacron-1.5.2-4.el8.x86_64                                                          197/256
  Running scriptlet: cronie-anacron-1.5.2-4.el8.x86_64                                                          197/256
  Running scriptlet: openssh-8.0p1-5.el8.x86_64                                                                 198/256
  Installing       : openssh-8.0p1-5.el8.x86_64                                                                 198/256
  Installing       : ima-evm-utils-1.1-5.el8.x86_64                                                             199/256
  Running scriptlet: unbound-libs-1.7.3-14.el8.x86_64                                                           200/256
  Installing       : unbound-libs-1.7.3-14.el8.x86_64                                                           200/256
  Running scriptlet: unbound-libs-1.7.3-14.el8.x86_64                                                           200/256
  Installing       : python3-unbound-1.7.3-14.el8.x86_64                                                        201/256
  Installing       : libverto-libevent-0.3.0-5.el8.x86_64                                                       202/256
  Installing       : gssproxy-0.8.0-16.el8.x86_64                                                               203/256
  Running scriptlet: gssproxy-0.8.0-16.el8.x86_64                                                               203/256
  Installing       : iputils-20180629-2.el8.x86_64                                                              204/256
  Running scriptlet: iputils-20180629-2.el8.x86_64                                                              204/256
  Installing       : NetworkManager-libnm-1:1.26.0-13.el8.x86_64                                                205/256
  Running scriptlet: NetworkManager-libnm-1:1.26.0-13.el8.x86_64                                                205/256
  Installing       : dbus-glib-0.110-2.el8.x86_64                                                               206/256
  Running scriptlet: dbus-glib-0.110-2.el8.x86_64                                                               206/256
  Installing       : python3-dbus-1.2.4-15.el8.x86_64                                                           207/256
  Installing       : libsecret-0.18.6-1.el8.x86_64                                                              208/256
  Installing       : pinentry-1.1.0-2.el8.x86_64                                                                209/256
  Running scriptlet: pinentry-1.1.0-2.el8.x86_64                                                                209/256
  Installing       : policycoreutils-2.9-9.el8.x86_64                                                           210/256
  Running scriptlet: policycoreutils-2.9-9.el8.x86_64                                                           210/256
  Running scriptlet: rpcbind-1.2.5-7.el8.x86_64                                                                 211/256
  Installing       : rpcbind-1.2.5-7.el8.x86_64                                                                 211/256
  Running scriptlet: rpcbind-1.2.5-7.el8.x86_64                                                                 211/256
  Installing       : rpm-plugin-systemd-inhibit-4.14.3-4.el8.x86_64                                             212/256
  Installing       : iproute-5.3.0-5.el8.x86_64                                                                 213/256
  Installing       : bind-export-libs-32:9.11.20-5.el8.1.x86_64                                                 214/256
  Running scriptlet: bind-export-libs-32:9.11.20-5.el8.1.x86_64                                                 214/256
  Installing       : fipscheck-lib-1.5.0-4.el8.x86_64                                                           215/256
  Running scriptlet: fipscheck-lib-1.5.0-4.el8.x86_64                                                           215/256
  Installing       : fipscheck-1.5.0-4.el8.x86_64                                                               216/256
  Installing       : dhcp-libs-12:4.3.6-41.el8.x86_64                                                           217/256
  Installing       : libusbx-1.0.23-4.el8.x86_64                                                                218/256
  Installing       : gnupg2-smime-2.2.20-2.el8.x86_64                                                           219/256
  Installing       : gnupg2-2.2.20-2.el8.x86_64                                                                 220/256
  Installing       : gpgme-1.13.1-3.el8.x86_64                                                                  221/256
  Installing       : librepo-1.12.0-2.el8.x86_64                                                                222/256
  Installing       : libdnf-0.48.0-5.el8.x86_64                                                                 223/256
  Installing       : python3-libdnf-0.48.0-5.el8.x86_64                                                         224/256
  Installing       : python3-hawkey-0.48.0-5.el8.x86_64                                                         225/256
  Installing       : python3-gpg-1.13.1-3.el8.x86_64                                                            226/256
  Installing       : rpm-build-libs-4.14.3-4.el8.x86_64                                                         227/256
  Running scriptlet: rpm-build-libs-4.14.3-4.el8.x86_64                                                         227/256
  Installing       : python3-rpm-4.14.3-4.el8.x86_64                                                            228/256
  Running scriptlet: logrotate-3.14.0-4.el8.x86_64                                                              229/256
  Installing       : logrotate-3.14.0-4.el8.x86_64                                                              229/256
  Installing       : libnfsidmap-1:2.3.3-35.el8.x86_64                                                          230/256
  Installing       : quota-1:4.04-10.el8.x86_64                                                                 231/256
  Installing       : python3-libcomps-0.1.11-4.el8.x86_64                                                       232/256
  Installing       : python3-dnf-4.2.23-4.el8.noarch                                                            233/256
  Installing       : python3-pyyaml-3.12-12.el8.x86_64                                                          234/256
  Running scriptlet: nfs-utils-1:2.3.3-35.el8.x86_64                                                            235/256
  Installing       : nfs-utils-1:2.3.3-35.el8.x86_64                                                            235/256
  Running scriptlet: nfs-utils-1:2.3.3-35.el8.x86_64                                                            235/256
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down

System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down

  Installing       : dnf-4.2.23-4.el8.noarch                                                                    236/256
  Running scriptlet: dnf-4.2.23-4.el8.noarch                                                                    236/256
  Installing       : rsyslog-8.1911.0-6.el8.x86_64                                                              237/256
  Running scriptlet: rsyslog-8.1911.0-6.el8.x86_64                                                              237/256
  Installing       : wget-1.19.5-10.el8.x86_64                                                                  238/256
  Running scriptlet: wget-1.19.5-10.el8.x86_64                                                                  238/256
  Installing       : dhcp-client-12:4.3.6-41.el8.x86_64                                                         239/256
  Running scriptlet: NetworkManager-1:1.26.0-13.el8.x86_64                                                      240/256
  Installing       : NetworkManager-1:1.26.0-13.el8.x86_64                                                      240/256
  Running scriptlet: NetworkManager-1:1.26.0-13.el8.x86_64                                                      240/256
  Installing       : openssh-clients-8.0p1-5.el8.x86_64                                                         241/256
  Running scriptlet: openssh-server-8.0p1-5.el8.x86_64                                                          242/256
  Installing       : openssh-server-8.0p1-5.el8.x86_64                                                          242/256
  Running scriptlet: openssh-server-8.0p1-5.el8.x86_64                                                          242/256
  Installing       : ipmitool-1.8.18-17.el8.x86_64                                                              243/256
  Installing       : initscripts-10.00.9-1.el8.x86_64                                                           244/256
  Running scriptlet: initscripts-10.00.9-1.el8.x86_64                                                           244/256
  Installing       : net-tools-2.0-0.52.20160912git.el8.x86_64                                                  245/256
  Running scriptlet: net-tools-2.0-0.52.20160912git.el8.x86_64                                                  245/256
  Installing       : polkit-libs-0.115-11.el8.x86_64                                                            246/256
  Running scriptlet: polkit-libs-0.115-11.el8.x86_64                                                            246/256
  Installing       : sudo-1.8.29-6.el8.1.x86_64                                                                 247/256
  Running scriptlet: sudo-1.8.29-6.el8.1.x86_64                                                                 247/256
  Installing       : pciutils-3.6.4-2.el8.x86_64                                                                248/256
  Installing       : e2fsprogs-1.45.6-1.el8.x86_64                                                              249/256
  Installing       : strace-5.1-1.el8.x86_64                                                                    250/256
  Installing       : rsync-3.1.3-9.el8.x86_64                                                                   251/256
  Installing       : tar-2:1.30-5.el8.x86_64                                                                    252/256
  Running scriptlet: tar-2:1.30-5.el8.x86_64                                                                    252/256
  Installing       : less-530-1.el8.x86_64                                                                      253/256
  Installing       : ethtool-2:5.0-2.el8.x86_64                                                                 254/256
  Installing       : psmisc-23.1-5.el8.x86_64                                                                   255/256
  Installing       : words-3.0-28.el8.noarch                                                                    256/256
  Running scriptlet: filesystem-3.8-3.el8.x86_64                                                                256/256
  Running scriptlet: glibc-all-langpacks-2.28-127.el8.2.x86_64                                                  256/256
  Running scriptlet: crypto-policies-scripts-20210209-1.gitbfb6bed.el8.noarch                                   256/256
  Running scriptlet: ca-certificates-2020.2.41-80.0.el8_2.noarch                                                256/256
  Running scriptlet: glibc-common-2.28-127.el8.2.x86_64                                                         256/256
  Running scriptlet: info-6.5-6.el8.x86_64                                                                      256/256
  Running scriptlet: glib2-2.56.4-8.el8.x86_64                                                                  256/256
  Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                                                          256/256
  Running scriptlet: systemd-239-41.el8.2.x86_64                                                                256/256
  Running scriptlet: systemd-udev-239-41.el8.2.x86_64                                                           256/256
  Verifying        : geolite2-city-20180605-1.el8.noarch                                                          1/256
  Verifying        : geolite2-country-20180605-1.el8.noarch                                                       2/256
  Verifying        : ipmitool-1.8.18-17.el8.x86_64                                                                3/256
  Verifying        : libestr-0.1.10-1.el8.x86_64                                                                  4/256
  Verifying        : libfastjson-0.99.8-2.el8.x86_64                                                              5/256
  Verifying        : libmaxminddb-1.2.0-10.el8.x86_64                                                             6/256
  Verifying        : libxkbcommon-0.9.1-1.el8.x86_64                                                              7/256
  Verifying        : pinentry-1.1.0-2.el8.x86_64                                                                  8/256
  Verifying        : python3-unbound-1.7.3-14.el8.x86_64                                                          9/256
  Verifying        : rsyslog-8.1911.0-6.el8.x86_64                                                               10/256
  Verifying        : unbound-libs-1.7.3-14.el8.x86_64                                                            11/256
  Verifying        : wget-1.19.5-10.el8.x86_64                                                                   12/256
  Verifying        : xkeyboard-config-2.28-1.el8.noarch                                                          13/256
  Verifying        : NetworkManager-1:1.26.0-13.el8.x86_64                                                       14/256
  Verifying        : NetworkManager-libnm-1:1.26.0-13.el8.x86_64                                                 15/256
  Verifying        : acl-2.2.53-1.el8.x86_64                                                                     16/256
  Verifying        : audit-libs-3.0-0.17.20191104git1c2f876.el8.x86_64                                           17/256
  Verifying        : basesystem-11-5.el8.noarch                                                                  18/256
  Verifying        : bash-4.4.19-12.el8.x86_64                                                                   19/256
  Verifying        : bind-export-libs-32:9.11.20-5.el8.1.x86_64                                                  20/256
  Verifying        : brotli-1.0.6-2.el8.x86_64                                                                   21/256
  Verifying        : bzip2-libs-1.0.6-26.el8.x86_64                                                              22/256
  Verifying        : ca-certificates-2020.2.41-80.0.el8_2.noarch                                                 23/256
  Verifying        : chkconfig-1.13-2.el8.x86_64                                                                 24/256
  Verifying        : coreutils-8.30-8.el8.x86_64                                                                 25/256
  Verifying        : coreutils-common-8.30-8.el8.x86_64                                                          26/256
  Verifying        : cpio-2.12-8.el8.x86_64                                                                      27/256
  Verifying        : cracklib-2.9.6-15.el8.x86_64                                                                28/256
  Verifying        : cracklib-dicts-2.9.6-15.el8.x86_64                                                          29/256
  Verifying        : cronie-1.5.2-4.el8.x86_64                                                                   30/256
  Verifying        : cronie-anacron-1.5.2-4.el8.x86_64                                                           31/256
  Verifying        : crontabs-1.11-16.20150630git.el8.noarch                                                     32/256
  Verifying        : crypto-policies-20210209-1.gitbfb6bed.el8.noarch                                            33/256
  Verifying        : crypto-policies-scripts-20210209-1.gitbfb6bed.el8.noarch                                    34/256
  Verifying        : cryptsetup-libs-2.3.3-2.el8.x86_64                                                          35/256
  Verifying        : curl-7.61.1-14.el8.1.x86_64                                                                 36/256
  Verifying        : cyrus-sasl-lib-2.1.27-5.el8.x86_64                                                          37/256
  Verifying        : dbus-1:1.12.8-12.el8.x86_64                                                                 38/256
  Verifying        : dbus-common-1:1.12.8-12.el8.noarch                                                          39/256
  Verifying        : dbus-daemon-1:1.12.8-12.el8.x86_64                                                          40/256
  Verifying        : dbus-glib-0.110-2.el8.x86_64                                                                41/256
  Verifying        : dbus-libs-1:1.12.8-12.el8.x86_64                                                            42/256
  Verifying        : dbus-tools-1:1.12.8-12.el8.x86_64                                                           43/256
  Verifying        : device-mapper-8:1.02.171-5.el8.2.x86_64                                                     44/256
  Verifying        : device-mapper-libs-8:1.02.171-5.el8.2.x86_64                                                45/256
  Verifying        : dhcp-client-12:4.3.6-41.el8.x86_64                                                          46/256
  Verifying        : dhcp-common-12:4.3.6-41.el8.noarch                                                          47/256
  Verifying        : dhcp-libs-12:4.3.6-41.el8.x86_64                                                            48/256
  Verifying        : diffutils-3.6-6.el8.x86_64                                                                  49/256
  Verifying        : dnf-4.2.23-4.el8.noarch                                                                     50/256
  Verifying        : dnf-data-4.2.23-4.el8.noarch                                                                51/256
  Verifying        : dracut-049-95.git20200804.el8.4.x86_64                                                      52/256
  Verifying        : e2fsprogs-1.45.6-1.el8.x86_64                                                               53/256
  Verifying        : e2fsprogs-libs-1.45.6-1.el8.x86_64                                                          54/256
  Verifying        : elfutils-debuginfod-client-0.180-1.el8.x86_64                                               55/256
  Verifying        : elfutils-default-yama-scope-0.180-1.el8.noarch                                              56/256
  Verifying        : elfutils-libelf-0.180-1.el8.x86_64                                                          57/256
  Verifying        : elfutils-libs-0.180-1.el8.x86_64                                                            58/256
  Verifying        : ethtool-2:5.0-2.el8.x86_64                                                                  59/256
  Verifying        : expat-2.2.5-4.el8.x86_64                                                                    60/256
  Verifying        : file-5.33-16.el8.1.x86_64                                                                   61/256
  Verifying        : file-libs-5.33-16.el8.1.x86_64                                                              62/256
  Verifying        : filesystem-3.8-3.el8.x86_64                                                                 63/256
  Verifying        : findutils-1:4.6.0-20.el8.x86_64                                                             64/256
  Verifying        : fipscheck-1.5.0-4.el8.x86_64                                                                65/256
  Verifying        : fipscheck-lib-1.5.0-4.el8.x86_64                                                            66/256
  Verifying        : fuse-libs-2.9.7-12.el8.x86_64                                                               67/256
  Verifying        : gawk-4.2.1-1.el8.x86_64                                                                     68/256
  Verifying        : gdbm-1:1.18-1.el8.x86_64                                                                    69/256
  Verifying        : gdbm-libs-1:1.18-1.el8.x86_64                                                               70/256
  Verifying        : gettext-0.19.8.1-17.el8.x86_64                                                              71/256
  Verifying        : gettext-libs-0.19.8.1-17.el8.x86_64                                                         72/256
  Verifying        : glib2-2.56.4-8.el8.x86_64                                                                   73/256
  Verifying        : glibc-2.28-127.el8.2.x86_64                                                                 74/256
  Verifying        : glibc-all-langpacks-2.28-127.el8.2.x86_64                                                   75/256
  Verifying        : glibc-common-2.28-127.el8.2.x86_64                                                          76/256
  Verifying        : gmp-1:6.1.2-10.el8.x86_64                                                                   77/256
  Verifying        : gnupg2-2.2.20-2.el8.x86_64                                                                  78/256
  Verifying        : gnupg2-smime-2.2.20-2.el8.x86_64                                                            79/256
  Verifying        : gnutls-3.6.14-8.el8.x86_64                                                                  80/256
  Verifying        : gpgme-1.13.1-3.el8.x86_64                                                                   81/256
  Verifying        : grep-3.1-6.el8.x86_64                                                                       82/256
  Verifying        : grub2-common-1:2.02-90.el8.1.noarch                                                         83/256
  Verifying        : grub2-tools-1:2.02-90.el8.1.x86_64                                                          84/256
  Verifying        : grub2-tools-minimal-1:2.02-90.el8.1.x86_64                                                  85/256
  Verifying        : grubby-8.40-41.el8.x86_64                                                                   86/256
  Verifying        : gssproxy-0.8.0-16.el8.x86_64                                                                87/256
  Verifying        : gzip-1.9-9.el8.x86_64                                                                       88/256
  Verifying        : hardlink-1:1.3-6.el8.x86_64                                                                 89/256
  Verifying        : hwdata-0.314-8.6.el8.noarch                                                                 90/256
  Verifying        : ima-evm-utils-1.1-5.el8.x86_64                                                              91/256
  Verifying        : info-6.5-6.el8.x86_64                                                                       92/256
  Verifying        : initscripts-10.00.9-1.el8.x86_64                                                            93/256
  Verifying        : ipcalc-0.2.4-4.el8.x86_64                                                                   94/256
  Verifying        : iproute-5.3.0-5.el8.x86_64                                                                  95/256
  Verifying        : iptables-libs-1.8.4-15.el8.3.x86_64                                                         96/256
  Verifying        : iputils-20180629-2.el8.x86_64                                                               97/256
  Verifying        : json-c-0.13.1-0.2.el8.x86_64                                                                98/256
  Verifying        : kbd-2.0.4-10.el8.x86_64                                                                     99/256
  Verifying        : kbd-legacy-2.0.4-10.el8.noarch                                                             100/256
  Verifying        : kbd-misc-2.0.4-10.el8.noarch                                                               101/256
  Verifying        : keyutils-1.5.10-6.el8.x86_64                                                               102/256
  Verifying        : keyutils-libs-1.5.10-6.el8.x86_64                                                          103/256
  Verifying        : kmod-25-16.el8.1.x86_64                                                                    104/256
  Verifying        : kmod-libs-25-16.el8.1.x86_64                                                               105/256
  Verifying        : kpartx-0.8.4-5.el8.x86_64                                                                  106/256
  Verifying        : krb5-libs-1.18.2-5.el8.x86_64                                                              107/256
  Verifying        : less-530-1.el8.x86_64                                                                      108/256
  Verifying        : libacl-2.2.53-1.el8.x86_64                                                                 109/256
  Verifying        : libarchive-3.3.2-9.el8.x86_64                                                              110/256
  Verifying        : libassuan-2.5.1-3.el8.x86_64                                                               111/256
  Verifying        : libattr-2.4.48-3.el8.x86_64                                                                112/256
  Verifying        : libbasicobjects-0.1.1-39.el8.x86_64                                                        113/256
  Verifying        : libblkid-2.32.1-24.el8.x86_64                                                              114/256
  Verifying        : libcap-2.26-4.el8.x86_64                                                                   115/256
  Verifying        : libcap-ng-0.7.9-5.el8.x86_64                                                               116/256
  Verifying        : libcollection-0.7.0-39.el8.x86_64                                                          117/256
  Verifying        : libcom_err-1.45.6-1.el8.x86_64                                                             118/256
  Verifying        : libcomps-0.1.11-4.el8.x86_64                                                               119/256
  Verifying        : libcroco-0.6.12-4.el8_2.1.x86_64                                                           120/256
  Verifying        : libcurl-7.61.1-14.el8.1.x86_64                                                             121/256
  Verifying        : libdb-5.3.28-39.el8.x86_64                                                                 122/256
  Verifying        : libdb-utils-5.3.28-39.el8.x86_64                                                           123/256
  Verifying        : libdnf-0.48.0-5.el8.x86_64                                                                 124/256
  Verifying        : libedit-3.1-23.20170329cvs.el8.x86_64                                                      125/256
  Verifying        : libevent-2.1.8-5.el8.x86_64                                                                126/256
  Verifying        : libfdisk-2.32.1-24.el8.x86_64                                                              127/256
  Verifying        : libffi-3.1-22.el8.x86_64                                                                   128/256
  Verifying        : libgcc-8.3.1-5.1.el8.x86_64                                                                129/256
  Verifying        : libgcrypt-1.8.5-4.el8.x86_64                                                               130/256
  Verifying        : libgomp-8.3.1-5.1.el8.x86_64                                                               131/256
  Verifying        : libgpg-error-1.31-1.el8.x86_64                                                             132/256
  Verifying        : libidn2-2.2.0-1.el8.x86_64                                                                 133/256
  Verifying        : libini_config-1.3.1-39.el8.x86_64                                                          134/256
  Verifying        : libkcapi-1.2.0-2.el8.x86_64                                                                135/256
  Verifying        : libkcapi-hmaccalc-1.2.0-2.el8.x86_64                                                       136/256
  Verifying        : libksba-1.3.5-7.el8.x86_64                                                                 137/256
  Verifying        : libmetalink-0.1.3-7.el8.x86_64                                                             138/256
  Verifying        : libmnl-1.0.4-6.el8.x86_64                                                                  139/256
  Verifying        : libmodulemd-2.9.4-2.el8.x86_64                                                             140/256
  Verifying        : libmount-2.32.1-24.el8.x86_64                                                              141/256
  Verifying        : libndp-1.7-3.el8.x86_64                                                                    142/256
  Verifying        : libnfsidmap-1:2.3.3-35.el8.x86_64                                                          143/256
  Verifying        : libnghttp2-1.33.0-3.el8_3.1.x86_64                                                         144/256
  Verifying        : libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64                                              145/256
  Verifying        : libpath_utils-0.2.1-39.el8.x86_64                                                          146/256
  Verifying        : libpcap-14:1.9.1-4.el8.x86_64                                                              147/256
  Verifying        : libpsl-0.20.2-6.el8.x86_64                                                                 148/256
  Verifying        : libpwquality-1.4.0-9.el8.x86_64                                                            149/256
  Verifying        : libref_array-0.1.5-39.el8.x86_64                                                           150/256
  Verifying        : librepo-1.12.0-2.el8.x86_64                                                                151/256
  Verifying        : libreport-filesystem-2.9.5-15.el8.rocky.x86_64                                             152/256
  Verifying        : libseccomp-2.4.3-1.el8.x86_64                                                              153/256
  Verifying        : libsecret-0.18.6-1.el8.x86_64                                                              154/256
  Verifying        : libselinux-2.9-4.el8_3.x86_64                                                              155/256
  Verifying        : libselinux-utils-2.9-4.el8_3.x86_64                                                        156/256
  Verifying        : libsemanage-2.9-3.el8.x86_64                                                               157/256
  Verifying        : libsepol-2.9-1.el8.x86_64                                                                  158/256
  Verifying        : libsigsegv-2.11-5.el8.x86_64                                                               159/256
  Verifying        : libsmartcols-2.32.1-24.el8.x86_64                                                          160/256
  Verifying        : libsolv-0.7.11-1.el8.x86_64                                                                161/256
  Verifying        : libss-1.45.6-1.el8.x86_64                                                                  162/256
  Verifying        : libssh-0.9.4-2.el8.x86_64                                                                  163/256
  Verifying        : libssh-config-0.9.4-2.el8.noarch                                                           164/256
  Verifying        : libstdc++-8.3.1-5.1.el8.x86_64                                                             165/256
  Verifying        : libtasn1-4.13-3.el8.x86_64                                                                 166/256
  Verifying        : libtirpc-1.1.4-4.el8.x86_64                                                                167/256
  Verifying        : libunistring-0.9.9-3.el8.x86_64                                                            168/256
  Verifying        : libusbx-1.0.23-4.el8.x86_64                                                                169/256
  Verifying        : libutempter-1.1.6-14.el8.x86_64                                                            170/256
  Verifying        : libuuid-2.32.1-24.el8.x86_64                                                               171/256
  Verifying        : libverto-0.3.0-5.el8.x86_64                                                                172/256
  Verifying        : libverto-libevent-0.3.0-5.el8.x86_64                                                       173/256
  Verifying        : libxcrypt-4.1.1-4.el8.x86_64                                                               174/256
  Verifying        : libxml2-2.9.7-8.el8.x86_64                                                                 175/256
  Verifying        : libyaml-0.1.7-5.el8.x86_64                                                                 176/256
  Verifying        : libzstd-1.4.4-1.el8.x86_64                                                                 177/256
  Verifying        : logrotate-3.14.0-4.el8.x86_64                                                              178/256
  Verifying        : lua-libs-5.3.4-11.el8.x86_64                                                               179/256
  Verifying        : lz4-libs-1.8.3-2.el8.x86_64                                                                180/256
  Verifying        : memstrack-0.1.11-1.el8.x86_64                                                              181/256
  Verifying        : mpfr-3.1.6-1.el8.x86_64                                                                    182/256
  Verifying        : ncurses-6.1-7.20180224.el8.x86_64                                                          183/256
  Verifying        : ncurses-base-6.1-7.20180224.el8.noarch                                                     184/256
  Verifying        : ncurses-libs-6.1-7.20180224.el8.x86_64                                                     185/256
  Verifying        : net-tools-2.0-0.52.20160912git.el8.x86_64                                                  186/256
  Verifying        : nettle-3.4.1-2.el8.x86_64                                                                  187/256
  Verifying        : nfs-utils-1:2.3.3-35.el8.x86_64                                                            188/256
  Verifying        : npth-1.5-4.el8.x86_64                                                                      189/256
  Verifying        : openldap-2.4.46-15.el8.x86_64                                                              190/256
  Verifying        : openssh-8.0p1-5.el8.x86_64                                                                 191/256
  Verifying        : openssh-clients-8.0p1-5.el8.x86_64                                                         192/256
  Verifying        : openssh-server-8.0p1-5.el8.x86_64                                                          193/256
  Verifying        : openssl-1:1.1.1g-15.el8.x86_64                                                             194/256
  Verifying        : openssl-libs-1:1.1.1g-15.el8.x86_64                                                        195/256
  Verifying        : openssl-pkcs11-0.4.10-2.el8.x86_64                                                         196/256
  Verifying        : os-prober-1.74-6.el8.x86_64                                                                197/256
  Verifying        : p11-kit-0.23.14-5.el8_0.x86_64                                                             198/256
  Verifying        : p11-kit-trust-0.23.14-5.el8_0.x86_64                                                       199/256
  Verifying        : pam-1.3.1-11.el8.x86_64                                                                    200/256
  Verifying        : pciutils-3.6.4-2.el8.x86_64                                                                201/256
  Verifying        : pciutils-libs-3.6.4-2.el8.x86_64                                                           202/256
  Verifying        : pcre-8.42-4.el8.x86_64                                                                     203/256
  Verifying        : pcre2-10.32-2.el8.x86_64                                                                   204/256
  Verifying        : pigz-2.4-4.el8.x86_64                                                                      205/256
  Verifying        : platform-python-3.6.8-31.el8.x86_64                                                        206/256
  Verifying        : platform-python-pip-9.0.3-18.el8.noarch                                                    207/256
  Verifying        : platform-python-setuptools-39.2.0-6.el8.noarch                                             208/256
  Verifying        : policycoreutils-2.9-9.el8.x86_64                                                           209/256
  Verifying        : polkit-libs-0.115-11.el8.x86_64                                                            210/256
  Verifying        : popt-1.16-14.el8.x86_64                                                                    211/256
  Verifying        : procps-ng-3.3.15-3.el8.x86_64                                                              212/256
  Verifying        : psmisc-23.1-5.el8.x86_64                                                                   213/256
  Verifying        : publicsuffix-list-dafsa-20180723-1.el8.noarch                                              214/256
  Verifying        : python3-dbus-1.2.4-15.el8.x86_64                                                           215/256
  Verifying        : python3-dnf-4.2.23-4.el8.noarch                                                            216/256
  Verifying        : python3-gpg-1.13.1-3.el8.x86_64                                                            217/256
  Verifying        : python3-hawkey-0.48.0-5.el8.x86_64                                                         218/256
  Verifying        : python3-libcomps-0.1.11-4.el8.x86_64                                                       219/256
  Verifying        : python3-libdnf-0.48.0-5.el8.x86_64                                                         220/256
  Verifying        : python3-libs-3.6.8-31.el8.x86_64                                                           221/256
  Verifying        : python3-pip-wheel-9.0.3-18.el8.noarch                                                      222/256
  Verifying        : python3-pyyaml-3.12-12.el8.x86_64                                                          223/256
  Verifying        : python3-rpm-4.14.3-4.el8.x86_64                                                            224/256
  Verifying        : python3-setuptools-wheel-39.2.0-6.el8.noarch                                               225/256
  Verifying        : quota-1:4.04-10.el8.x86_64                                                                 226/256
  Verifying        : quota-nls-1:4.04-10.el8.noarch                                                             227/256
  Verifying        : readline-7.0-10.el8.x86_64                                                                 228/256
  Verifying        : rpcbind-1.2.5-7.el8.x86_64                                                                 229/256
  Verifying        : rpm-4.14.3-4.el8.x86_64                                                                    230/256
  Verifying        : rpm-build-libs-4.14.3-4.el8.x86_64                                                         231/256
  Verifying        : rpm-libs-4.14.3-4.el8.x86_64                                                               232/256
  Verifying        : rpm-plugin-systemd-inhibit-4.14.3-4.el8.x86_64                                             233/256
  Verifying        : rsync-3.1.3-9.el8.x86_64                                                                   234/256
  Verifying        : sed-4.5-2.el8.x86_64                                                                       235/256
  Verifying        : setup-2.12.2-6.el8.noarch                                                                  236/256
  Verifying        : shadow-utils-2:4.6-11.el8.x86_64                                                           237/256
  Verifying        : shared-mime-info-1.9-3.el8.x86_64                                                          238/256
  Verifying        : sqlite-libs-3.26.0-11.el8.x86_64                                                           239/256
  Verifying        : strace-5.1-1.el8.x86_64                                                                    240/256
  Verifying        : sudo-1.8.29-6.el8.1.x86_64                                                                 241/256
  Verifying        : systemd-239-41.el8.2.x86_64                                                                242/256
  Verifying        : systemd-libs-239-41.el8.2.x86_64                                                           243/256
  Verifying        : systemd-pam-239-41.el8.2.x86_64                                                            244/256
  Verifying        : systemd-udev-239-41.el8.2.x86_64                                                           245/256
  Verifying        : tar-2:1.30-5.el8.x86_64                                                                    246/256
  Verifying        : trousers-0.3.14-4.el8.x86_64                                                               247/256
  Verifying        : trousers-lib-0.3.14-4.el8.x86_64                                                           248/256
  Verifying        : tzdata-2021a-1.el8.noarch                                                                  249/256
  Verifying        : util-linux-2.32.1-24.el8.x86_64                                                            250/256
  Verifying        : vim-minimal-2:8.0.1763-15.el8.x86_64                                                       251/256
  Verifying        : which-2.21-12.el8.x86_64                                                                   252/256
  Verifying        : words-3.0-28.el8.noarch                                                                    253/256
  Verifying        : xz-5.2.4-3.el8.x86_64                                                                      254/256
  Verifying        : xz-libs-5.2.4-3.el8.x86_64                                                                 255/256
  Verifying        : zlib-1.2.11-16.2.el8.x86_64                                                                256/256
Installed products updated.

Installed:
  NetworkManager-1:1.26.0-13.el8.x86_64                          NetworkManager-libnm-1:1.26.0-13.el8.x86_64
  acl-2.2.53-1.el8.x86_64                                        audit-libs-3.0-0.17.20191104git1c2f876.el8.x86_64
  basesystem-11-5.el8.noarch                                     bash-4.4.19-12.el8.x86_64
  bind-export-libs-32:9.11.20-5.el8.1.x86_64                     brotli-1.0.6-2.el8.x86_64
  bzip2-libs-1.0.6-26.el8.x86_64                                 ca-certificates-2020.2.41-80.0.el8_2.noarch
  chkconfig-1.13-2.el8.x86_64                                    coreutils-8.30-8.el8.x86_64
  coreutils-common-8.30-8.el8.x86_64                             cpio-2.12-8.el8.x86_64
  cracklib-2.9.6-15.el8.x86_64                                   cracklib-dicts-2.9.6-15.el8.x86_64
  cronie-1.5.2-4.el8.x86_64                                      cronie-anacron-1.5.2-4.el8.x86_64
  crontabs-1.11-16.20150630git.el8.noarch                        crypto-policies-20210209-1.gitbfb6bed.el8.noarch
  crypto-policies-scripts-20210209-1.gitbfb6bed.el8.noarch       cryptsetup-libs-2.3.3-2.el8.x86_64
  curl-7.61.1-14.el8.1.x86_64                                    cyrus-sasl-lib-2.1.27-5.el8.x86_64
  dbus-1:1.12.8-12.el8.x86_64                                    dbus-common-1:1.12.8-12.el8.noarch
  dbus-daemon-1:1.12.8-12.el8.x86_64                             dbus-glib-0.110-2.el8.x86_64
  dbus-libs-1:1.12.8-12.el8.x86_64                               dbus-tools-1:1.12.8-12.el8.x86_64
  device-mapper-8:1.02.171-5.el8.2.x86_64                        device-mapper-libs-8:1.02.171-5.el8.2.x86_64
  dhcp-client-12:4.3.6-41.el8.x86_64                             dhcp-common-12:4.3.6-41.el8.noarch
  dhcp-libs-12:4.3.6-41.el8.x86_64                               diffutils-3.6-6.el8.x86_64
  dnf-4.2.23-4.el8.noarch                                        dnf-data-4.2.23-4.el8.noarch
  dracut-049-95.git20200804.el8.4.x86_64                         e2fsprogs-1.45.6-1.el8.x86_64
  e2fsprogs-libs-1.45.6-1.el8.x86_64                             elfutils-debuginfod-client-0.180-1.el8.x86_64
  elfutils-default-yama-scope-0.180-1.el8.noarch                 elfutils-libelf-0.180-1.el8.x86_64
  elfutils-libs-0.180-1.el8.x86_64                               ethtool-2:5.0-2.el8.x86_64
  expat-2.2.5-4.el8.x86_64                                       file-5.33-16.el8.1.x86_64
  file-libs-5.33-16.el8.1.x86_64                                 filesystem-3.8-3.el8.x86_64
  findutils-1:4.6.0-20.el8.x86_64                                fipscheck-1.5.0-4.el8.x86_64
  fipscheck-lib-1.5.0-4.el8.x86_64                               fuse-libs-2.9.7-12.el8.x86_64
  gawk-4.2.1-1.el8.x86_64                                        gdbm-1:1.18-1.el8.x86_64
  gdbm-libs-1:1.18-1.el8.x86_64                                  geolite2-city-20180605-1.el8.noarch
  geolite2-country-20180605-1.el8.noarch                         gettext-0.19.8.1-17.el8.x86_64
  gettext-libs-0.19.8.1-17.el8.x86_64                            glib2-2.56.4-8.el8.x86_64
  glibc-2.28-127.el8.2.x86_64                                    glibc-all-langpacks-2.28-127.el8.2.x86_64
  glibc-common-2.28-127.el8.2.x86_64                             gmp-1:6.1.2-10.el8.x86_64
  gnupg2-2.2.20-2.el8.x86_64                                     gnupg2-smime-2.2.20-2.el8.x86_64
  gnutls-3.6.14-8.el8.x86_64                                     gpgme-1.13.1-3.el8.x86_64
  grep-3.1-6.el8.x86_64                                          grub2-common-1:2.02-90.el8.1.noarch
  grub2-tools-1:2.02-90.el8.1.x86_64                             grub2-tools-minimal-1:2.02-90.el8.1.x86_64
  grubby-8.40-41.el8.x86_64                                      gssproxy-0.8.0-16.el8.x86_64
  gzip-1.9-9.el8.x86_64                                          hardlink-1:1.3-6.el8.x86_64
  hwdata-0.314-8.6.el8.noarch                                    ima-evm-utils-1.1-5.el8.x86_64
  info-6.5-6.el8.x86_64                                          initscripts-10.00.9-1.el8.x86_64
  ipcalc-0.2.4-4.el8.x86_64                                      ipmitool-1.8.18-17.el8.x86_64
  iproute-5.3.0-5.el8.x86_64                                     iptables-libs-1.8.4-15.el8.3.x86_64
  iputils-20180629-2.el8.x86_64                                  json-c-0.13.1-0.2.el8.x86_64
  kbd-2.0.4-10.el8.x86_64                                        kbd-legacy-2.0.4-10.el8.noarch
  kbd-misc-2.0.4-10.el8.noarch                                   keyutils-1.5.10-6.el8.x86_64
  keyutils-libs-1.5.10-6.el8.x86_64                              kmod-25-16.el8.1.x86_64
  kmod-libs-25-16.el8.1.x86_64                                   kpartx-0.8.4-5.el8.x86_64
  krb5-libs-1.18.2-5.el8.x86_64                                  less-530-1.el8.x86_64
  libacl-2.2.53-1.el8.x86_64                                     libarchive-3.3.2-9.el8.x86_64
  libassuan-2.5.1-3.el8.x86_64                                   libattr-2.4.48-3.el8.x86_64
  libbasicobjects-0.1.1-39.el8.x86_64                            libblkid-2.32.1-24.el8.x86_64
  libcap-2.26-4.el8.x86_64                                       libcap-ng-0.7.9-5.el8.x86_64
  libcollection-0.7.0-39.el8.x86_64                              libcom_err-1.45.6-1.el8.x86_64
  libcomps-0.1.11-4.el8.x86_64                                   libcroco-0.6.12-4.el8_2.1.x86_64
  libcurl-7.61.1-14.el8.1.x86_64                                 libdb-5.3.28-39.el8.x86_64
  libdb-utils-5.3.28-39.el8.x86_64                               libdnf-0.48.0-5.el8.x86_64
  libedit-3.1-23.20170329cvs.el8.x86_64                          libestr-0.1.10-1.el8.x86_64
  libevent-2.1.8-5.el8.x86_64                                    libfastjson-0.99.8-2.el8.x86_64
  libfdisk-2.32.1-24.el8.x86_64                                  libffi-3.1-22.el8.x86_64
  libgcc-8.3.1-5.1.el8.x86_64                                    libgcrypt-1.8.5-4.el8.x86_64
  libgomp-8.3.1-5.1.el8.x86_64                                   libgpg-error-1.31-1.el8.x86_64
  libidn2-2.2.0-1.el8.x86_64                                     libini_config-1.3.1-39.el8.x86_64
  libkcapi-1.2.0-2.el8.x86_64                                    libkcapi-hmaccalc-1.2.0-2.el8.x86_64
  libksba-1.3.5-7.el8.x86_64                                     libmaxminddb-1.2.0-10.el8.x86_64
  libmetalink-0.1.3-7.el8.x86_64                                 libmnl-1.0.4-6.el8.x86_64
  libmodulemd-2.9.4-2.el8.x86_64                                 libmount-2.32.1-24.el8.x86_64
  libndp-1.7-3.el8.x86_64                                        libnfsidmap-1:2.3.3-35.el8.x86_64
  libnghttp2-1.33.0-3.el8_3.1.x86_64                             libnsl2-1.2.0-2.20180605git4a062cf.el8.x86_64
  libpath_utils-0.2.1-39.el8.x86_64                              libpcap-14:1.9.1-4.el8.x86_64
  libpsl-0.20.2-6.el8.x86_64                                     libpwquality-1.4.0-9.el8.x86_64
  libref_array-0.1.5-39.el8.x86_64                               librepo-1.12.0-2.el8.x86_64
  libreport-filesystem-2.9.5-15.el8.rocky.x86_64                 libseccomp-2.4.3-1.el8.x86_64
  libsecret-0.18.6-1.el8.x86_64                                  libselinux-2.9-4.el8_3.x86_64
  libselinux-utils-2.9-4.el8_3.x86_64                            libsemanage-2.9-3.el8.x86_64
  libsepol-2.9-1.el8.x86_64                                      libsigsegv-2.11-5.el8.x86_64
  libsmartcols-2.32.1-24.el8.x86_64                              libsolv-0.7.11-1.el8.x86_64
  libss-1.45.6-1.el8.x86_64                                      libssh-0.9.4-2.el8.x86_64
  libssh-config-0.9.4-2.el8.noarch                               libstdc++-8.3.1-5.1.el8.x86_64
  libtasn1-4.13-3.el8.x86_64                                     libtirpc-1.1.4-4.el8.x86_64
  libunistring-0.9.9-3.el8.x86_64                                libusbx-1.0.23-4.el8.x86_64
  libutempter-1.1.6-14.el8.x86_64                                libuuid-2.32.1-24.el8.x86_64
  libverto-0.3.0-5.el8.x86_64                                    libverto-libevent-0.3.0-5.el8.x86_64
  libxcrypt-4.1.1-4.el8.x86_64                                   libxkbcommon-0.9.1-1.el8.x86_64
  libxml2-2.9.7-8.el8.x86_64                                     libyaml-0.1.7-5.el8.x86_64
  libzstd-1.4.4-1.el8.x86_64                                     logrotate-3.14.0-4.el8.x86_64
  lua-libs-5.3.4-11.el8.x86_64                                   lz4-libs-1.8.3-2.el8.x86_64
  memstrack-0.1.11-1.el8.x86_64                                  mpfr-3.1.6-1.el8.x86_64
  ncurses-6.1-7.20180224.el8.x86_64                              ncurses-base-6.1-7.20180224.el8.noarch
  ncurses-libs-6.1-7.20180224.el8.x86_64                         net-tools-2.0-0.52.20160912git.el8.x86_64
  nettle-3.4.1-2.el8.x86_64                                      nfs-utils-1:2.3.3-35.el8.x86_64
  npth-1.5-4.el8.x86_64                                          openldap-2.4.46-15.el8.x86_64
  openssh-8.0p1-5.el8.x86_64                                     openssh-clients-8.0p1-5.el8.x86_64
  openssh-server-8.0p1-5.el8.x86_64                              openssl-1:1.1.1g-15.el8.x86_64
  openssl-libs-1:1.1.1g-15.el8.x86_64                            openssl-pkcs11-0.4.10-2.el8.x86_64
  os-prober-1.74-6.el8.x86_64                                    p11-kit-0.23.14-5.el8_0.x86_64
  p11-kit-trust-0.23.14-5.el8_0.x86_64                           pam-1.3.1-11.el8.x86_64
  pciutils-3.6.4-2.el8.x86_64                                    pciutils-libs-3.6.4-2.el8.x86_64
  pcre-8.42-4.el8.x86_64                                         pcre2-10.32-2.el8.x86_64
  pigz-2.4-4.el8.x86_64                                          pinentry-1.1.0-2.el8.x86_64
  platform-python-3.6.8-31.el8.x86_64                            platform-python-pip-9.0.3-18.el8.noarch
  platform-python-setuptools-39.2.0-6.el8.noarch                 policycoreutils-2.9-9.el8.x86_64
  polkit-libs-0.115-11.el8.x86_64                                popt-1.16-14.el8.x86_64
  procps-ng-3.3.15-3.el8.x86_64                                  psmisc-23.1-5.el8.x86_64
  publicsuffix-list-dafsa-20180723-1.el8.noarch                  python3-dbus-1.2.4-15.el8.x86_64
  python3-dnf-4.2.23-4.el8.noarch                                python3-gpg-1.13.1-3.el8.x86_64
  python3-hawkey-0.48.0-5.el8.x86_64                             python3-libcomps-0.1.11-4.el8.x86_64
  python3-libdnf-0.48.0-5.el8.x86_64                             python3-libs-3.6.8-31.el8.x86_64
  python3-pip-wheel-9.0.3-18.el8.noarch                          python3-pyyaml-3.12-12.el8.x86_64
  python3-rpm-4.14.3-4.el8.x86_64                                python3-setuptools-wheel-39.2.0-6.el8.noarch
  python3-unbound-1.7.3-14.el8.x86_64                            quota-1:4.04-10.el8.x86_64
  quota-nls-1:4.04-10.el8.noarch                                 readline-7.0-10.el8.x86_64
  rpcbind-1.2.5-7.el8.x86_64                                     rpm-4.14.3-4.el8.x86_64
  rpm-build-libs-4.14.3-4.el8.x86_64                             rpm-libs-4.14.3-4.el8.x86_64
  rpm-plugin-systemd-inhibit-4.14.3-4.el8.x86_64                 rsync-3.1.3-9.el8.x86_64
  rsyslog-8.1911.0-6.el8.x86_64                                  sed-4.5-2.el8.x86_64
  setup-2.12.2-6.el8.noarch                                      shadow-utils-2:4.6-11.el8.x86_64
  shared-mime-info-1.9-3.el8.x86_64                              sqlite-libs-3.26.0-11.el8.x86_64
  strace-5.1-1.el8.x86_64                                        sudo-1.8.29-6.el8.1.x86_64
  systemd-239-41.el8.2.x86_64                                    systemd-libs-239-41.el8.2.x86_64
  systemd-pam-239-41.el8.2.x86_64                                systemd-udev-239-41.el8.2.x86_64
  tar-2:1.30-5.el8.x86_64                                        trousers-0.3.14-4.el8.x86_64
  trousers-lib-0.3.14-4.el8.x86_64                               tzdata-2021a-1.el8.noarch
  unbound-libs-1.7.3-14.el8.x86_64                               util-linux-2.32.1-24.el8.x86_64
  vim-minimal-2:8.0.1763-15.el8.x86_64                           wget-1.19.5-10.el8.x86_64
  which-2.21-12.el8.x86_64                                       words-3.0-28.el8.noarch
  xkeyboard-config-2.28-1.el8.noarch                             xz-5.2.4-3.el8.x86_64
  xz-libs-5.2.4-3.el8.x86_64                                     zlib-1.2.11-16.2.el8.x86_64

Complete!
+ sudo mkdir -p /var/warewulf/chroots/rocky8
+ cd /home/vagrant/chroots/rocky8
+ sudo tar -cf - ./rootfs
+ cd /var/warewulf/chroots/rocky8
+ sudo tar -xf -
+ sudo wwctl container build --force rocky8
+ sudo wwctl container list
VNFS NAME                           BUILT  NODES
centos8                             true   0
rocky8                              true   2
rocky8-dnf-chroot                   true   0
+ set +e
+ sudo wwctl profile list
+ grep -q -E '^rocky8 '
+ ret=0
+ set -e
+ [[ 0 -eq 0 ]]
+ yes
+ sudo wwctl profile delete rocky8
Are you sure you want to delete 1 profile(s): y
+ sudo wwctl profile add rocky8
+ sudo wwctl profile set --yes --container rocky8 rocky8
+ sudo wwctl profile set --yes --comment 'This profile provides rocky8 VNFS' rocky8
++ uname -r
+ sudo wwctl profile set --yes --kernel 4.18.0-240.22.1.el8.x86_64 rocky8
+ sudo wwctl node set --yes --addprofile rocky8 cn0
+ sudo wwctl node set --yes --addprofile rocky8 cn1
+ sudo wwctl node list --long
NODE NAME              KERNEL VERSION             CONTAINER                           OVERLAYS (S/R)
========================================================================================================================
cn0                    4.18.0-240.22.1.el8.x86_64 rocky8                              (default)/(default)
cn1                    4.18.0-240.22.1.el8.x86_64 rocky8                              (default)/(default)
```
