# warewulf-vagrant provisioning sequence


## vagrant status

```
➜  warewulf-vagrant git:(main) ✗ vagrant status
Current machine states:

mgr                       not created (virtualbox)
cn0                       not created (virtualbox)
cn1                       not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```


## vagrant up

*NOTE: Some portions of the output are removed for brevity. These are marked with `...<snip>...` sequence.*

```
➜  warewulf-vagrant git:(main) ✗ date -j && vagrant up && date -j
Fri Dec 17 16:23:00 PST 2021


~/bo/warewulf-vagrant on development !8 ?2 ❯ date -j && vagrant up && date -j           at 16:22:40
Fri Dec 17 16:23:00 PST 2021
Bringing machine 'mgr' up with 'virtualbox' provider...
Bringing machine 'cn0' up with 'virtualbox' provider...
Bringing machine 'cn1' up with 'virtualbox' provider...

==> mgr: Importing base box 'rockylinux/8'...
==> mgr: Matching MAC address for NAT networking...
==> mgr: Checking if box 'rockylinux/8' version '4.0.0' is up to date...
==> mgr: Setting the name of the VM: warewulf-vagrant_mgr_1639786987909_67734
==> mgr: Fixed port collision for 22 => 2222. Now on port 2200.
==> mgr: Clearing any previously set network interfaces...
==> mgr: Preparing network interfaces based on configuration...
    mgr: Adapter 1: nat
    mgr: Adapter 2: hostonly
==> mgr: Forwarding ports...
    mgr: 22 (guest) => 2200 (host) (adapter 1)

==> mgr: Running 'pre-boot' VM customizations...
==> mgr: Booting VM...
==> mgr: Waiting for machine to boot. This may take a few minutes...
    mgr: SSH address: 127.0.0.1:2200
    mgr: SSH username: vagrant
    mgr: SSH auth method: private key
    mgr:
    mgr: Vagrant insecure key detected. Vagrant will automatically replace
    mgr: this with a newly generated keypair for better security.
    mgr:
    mgr: Inserting generated public key within guest...
    mgr: Removing insecure key from the guest if it's present...
    mgr: Key inserted! Disconnecting and reconnecting using new SSH key...
==> mgr: Machine booted and ready!
==> mgr: Setting hostname...
==> mgr: Configuring and enabling network interfaces...

==> mgr: Running provisioner: Warewulf v4 Host Setup (shell)...
    mgr: Running: script: Warewulf v4 Host Setup
    mgr: Rocky Linux 8 - AppStream                       3.2 MB/s | 8.5 MB     00:02
    mgr: Rocky Linux 8 - BaseOS                          4.2 MB/s | 3.6 MB     00:00
    mgr: Rocky Linux 8 - Extras                           24 kB/s |  10 kB     00:00
    mgr: Dependencies resolved.
    mgr: ================================================================================
    mgr:  Package                    Arch   Version                      Repo       Size
    mgr: ================================================================================
    mgr: Installing:
    mgr:  kernel                     x86_64 4.18.0-348.2.1.el8_5         baseos    7.0 M
    mgr:  kernel-core                x86_64 4.18.0-348.2.1.el8_5         baseos     38 M
    mgr:  kernel-modules             x86_64 4.18.0-348.2.1.el8_5         baseos     30 M

    ...<snip>...

    mgr:  xfsprogs                   x86_64 5.0.0-9.el8                  baseos    1.1 M
    mgr:  yum                        noarch 4.7.0-4.el8                  baseos    202 k
    mgr:  yum-utils                  noarch 4.0.21-3.el8                 baseos     71 k
    mgr: Installing dependencies:
    mgr:  grub2-tools-efi            x86_64 1:2.02-106.el8.0.2           baseos    474 k
    mgr:  libbpf                     x86_64 0.4.0-1.el8                  baseos    109 k
    mgr:
    mgr: Transaction Summary
    mgr: ================================================================================
    mgr: Install    5 Packages
    mgr: Upgrade  208 Packages
    mgr:
    mgr: Total download size: 421 M
    mgr: Downloading Packages:
    mgr: (1/213): grub2-tools-efi-2.02-106.el8.0.2.x86_6 661 kB/s | 474 kB     00:00
    mgr: (2/213): kernel-4.18.0-348.2.1.el8_5.x86_64.rpm 2.1 MB/s | 7.0 MB     00:03
    mgr: (3/213): libbpf-0.4.0-1.el8.x86_64.rpm          895 kB/s | 109 kB     00:00

    ...<snip>...

    mgr: (211/213): xfsprogs-5.0.0-9.el8.x86_64.rpm      1.2 MB/s | 1.1 MB     00:00
    mgr: (212/213): yum-utils-4.0.21-3.el8.noarch.rpm    850 kB/s |  71 kB     00:00
    mgr: (213/213): linux-firmware-20210702-103.gitd79c2 2.6 MB/s | 161 MB     01:01
    mgr: --------------------------------------------------------------------------------
    mgr: Total                                           4.6 MB/s | 421 MB     01:31
    mgr: Running transaction check
    mgr: Transaction check succeeded.
    mgr: Running transaction test
    mgr: Transaction test succeeded.
    mgr: Running transaction
    mgr:   Running scriptlet: filesystem-3.8-6.el8.x86_64                            1/1
    mgr:   Preparing        :                                                        1/1
    mgr:   Running scriptlet: libgcc-8.5.0-4.el8_5.x86_64                            1/1
    mgr:   Upgrading        : libgcc-8.5.0-4.el8_5.x86_64                          1/421
    mgr:   Running scriptlet: libgcc-8.5.0-4.el8_5.x86_64                          1/421

    ...<snip>...

    mgr:   Running scriptlet: systemd-udev-239-51.el8_5.3.x86_64                 421/421
    mgr:   Running scriptlet: glib2-2.56.4-156.el8.x86_64                        421/421
    mgr:   Running scriptlet: man-db-2.7.6.1-18.el8.x86_64                       421/421
    mgr:   Verifying        : grub2-tools-efi-1:2.02-106.el8.0.2.x86_64            1/421
    mgr:   Verifying        : kernel-4.18.0-348.2.1.el8_5.x86_64                   2/421
    mgr:   Verifying        : kernel-core-4.18.0-348.2.1.el8_5.x86_64              3/421

    ...<snip>...

    mgr:   Verifying        : yum-4.4.2-11.el8.noarch                            419/421
    mgr:   Verifying        : yum-utils-4.0.21-3.el8.noarch                      420/421
    mgr:   Verifying        : yum-utils-4.0.18-4.el8.noarch                      421/421
    mgr:
    mgr: Upgraded:
    mgr:   NetworkManager-1:1.32.10-4.el8.x86_64
    mgr:   NetworkManager-libnm-1:1.32.10-4.el8.x86_64
    mgr:   NetworkManager-team-1:1.32.10-4.el8.x86_64

    ...<snip>...

    mgr:   kernel-core-4.18.0-348.2.1.el8_5.x86_64
    mgr:   kernel-modules-4.18.0-348.2.1.el8_5.x86_64
    mgr:   libbpf-0.4.0-1.el8.x86_64
    mgr:
    mgr: Complete!

    mgr: Last metadata expiration check: 0:03:10 ago on Sat 18 Dec 2021 12:23:34 AM UTC.
    mgr: Dependencies resolved.
    mgr: ================================================================================
    mgr:  Package       Architecture    Version                 Repository          Size
    mgr: ================================================================================
    mgr: Installing:
    mgr:  wget          x86_64          1.19.5-10.el8           appstream          733 k
    mgr:
    mgr: Transaction Summary
    mgr: ================================================================================
    mgr: Install  1 Package
    mgr:
    mgr: Total download size: 733 k
    mgr: Installed size: 2.8 M
    mgr: Downloading Packages:
    mgr: wget-1.19.5-10.el8.x86_64.rpm                   1.5 MB/s | 733 kB     00:00
    mgr: --------------------------------------------------------------------------------
    mgr: Total                                           1.1 MB/s | 733 kB     00:00
    mgr: Running transaction check
    mgr: Transaction check succeeded.
    mgr: Running transaction test
    mgr: Transaction test succeeded.
    mgr: Running transaction
    mgr:   Preparing        :                                                        1/1
    mgr:   Installing       : wget-1.19.5-10.el8.x86_64                              1/1
    mgr:   Running scriptlet: wget-1.19.5-10.el8.x86_64                              1/1
    mgr:   Verifying        : wget-1.19.5-10.el8.x86_64                              1/1
    mgr:
    mgr: Installed:
    mgr:   wget-1.19.5-10.el8.x86_64
    mgr:
    mgr: Complete!
    mgr:
    mgr: 192.168.15.15    mgr.example.com mgr
    mgr:

==> mgr: Running provisioner: reload...
==> mgr: Attempting graceful shutdown of VM...
==> mgr: Checking if box 'rockylinux/8' version '4.0.0' is up to date...
==> mgr: Clearing any previously set forwarded ports...
==> mgr: Clearing any previously set network interfaces...
==> mgr: Preparing network interfaces based on configuration...
    mgr: Adapter 1: nat
    mgr: Adapter 2: hostonly
==> mgr: Forwarding ports...
    mgr: 22 (guest) => 2200 (host) (adapter 1)
==> mgr: Running 'pre-boot' VM customizations...
==> mgr: Booting VM...
==> mgr: Waiting for machine to boot. This may take a few minutes...
==> mgr: Machine booted and ready!
==> mgr: Setting hostname...
==> mgr: Configuring and enabling network interfaces...
==> mgr: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> mgr: flag to force provisioning. Provisioners marked to run always will still run.

==> mgr: Running provisioner: Warewulf v4 Install Developer Tools (shell)...
    mgr: Running: script: Warewulf v4 Install Developer Tools
    mgr: Last metadata expiration check: 0:03:44 ago on Sat 18 Dec 2021 12:23:34 AM UTC.
    mgr: Dependencies resolved.
    mgr: =======================================================================================================
    mgr:  Package                                Arch    Version                                Repo        Size
    mgr: =======================================================================================================
    mgr: Installing group/module packages:
    mgr:  asciidoc                               noarch  8.6.10-0.5.20180627gitf7c2274.el8      appstream  215 k
    mgr:  autoconf                               noarch  2.69-29.el8                            appstream  709 k
    mgr:  automake                               noarch  1.16.1-7.el8                           appstream  712 k

    ...<snip>...

    mgr:  perl-IO-Socket-IP                      noarch  0.39-5.el8                             appstream   46 k
    mgr:  perl-IO-Socket-SSL                     noarch  2.066-4.module+el8.4.0+512+d4f0fc54    appstream  297 k
    mgr:  perl-Mozilla-CA                        noarch  20160104-7.module+el8.4.0+529+e3b3e624 appstream   14 k
    mgr: Enabling module streams:
    mgr:  javapackages-runtime                           201801
    mgr: Installing Groups:
    mgr:  Development Tools
    mgr:
    mgr: Transaction Summary
    mgr: =======================================================================================================
    mgr: Install  221 Packages
    mgr:
    mgr: Total download size: 163 M
    mgr: Installed size: 539 M
    mgr: Downloading Packages:
    mgr: (1/221): adobe-mappings-cmap-deprecated-2017120 159 kB/s | 117 kB     00:00
    mgr: (2/221): annobin-9.72-1.el8_5.2.x86_64.rpm      898 kB/s | 110 kB     00:00
    mgr: (3/221): asciidoc-8.6.10-0.5.20180627gitf7c2274 1.1 MB/s | 215 kB     00:00

    ...<snip>...

    mgr: (219/221): zip-3.0-23.el8.x86_64.rpm            3.1 MB/s | 269 kB     00:00
    mgr: (220/221): zlib-devel-1.2.11-17.el8.x86_64.rpm  667 kB/s |  56 kB     00:00
    mgr: (221/221): valgrind-3.17.0-5.el8.x86_64.rpm     1.6 MB/s |  11 MB     00:06
    mgr: --------------------------------------------------------------------------------
    mgr: Total                                           6.4 MB/s | 163 MB     00:25
    mgr: Running transaction check
    mgr: Transaction check succeeded.
    mgr: Running transaction test
    mgr: Transaction test succeeded.
    mgr: Running transaction
    mgr:   Running scriptlet: copy-jdk-configs-4.0-2.el8.noarch                      1/1
    mgr:   Running scriptlet: java-1.8.0-openjdk-headless-1:1.8.0.312.b07-2.el8_5.   1/1
    mgr:   Preparing        :                                                        1/1

    ...<snip>...

    mgr:   Running scriptlet: gdk-pixbuf2-2.36.12-5.el8.x86_64                   221/221
    mgr:   Running scriptlet: fontconfig-2.13.1-4.el8.x86_64                     221/221
    mgr:   Running scriptlet: hicolor-icon-theme-0.17-2.el8.noarch               221/221
    mgr:   Verifying        : adobe-mappings-cmap-20171205-3.el8.noarch            1/221
    mgr:   Verifying        : adobe-mappings-cmap-deprecated-20171205-3.el8.no     2/221
    mgr:   Verifying        : adobe-mappings-pdf-20180407-1.el8.noarch             3/221

    ...<snip>...

    mgr:   Verifying        : xz-devel-5.2.4-3.el8.1.x86_64                      219/221
    mgr:   Verifying        : zip-3.0-23.el8.x86_64                              220/221
    mgr:   Verifying        : zlib-devel-1.2.11-17.el8.x86_64                    221/221
    mgr:
    mgr: Installed:
    mgr:   adobe-mappings-cmap-20171205-3.el8.noarch
    mgr:   adobe-mappings-cmap-deprecated-20171205-3.el8.noarch
    mgr:   adobe-mappings-pdf-20180407-1.el8.noarch

    ...<snip>...

    mgr:   zip-3.0-23.el8.x86_64
    mgr:   zlib-devel-1.2.11-17.el8.x86_64
    mgr:   zstd-1.4.4-1.el8.x86_64
    mgr:
    mgr: Complete!

    mgr: Last metadata expiration check: 0:04:50 ago on Sat 18 Dec 2021 12:23:34 AM UTC.
    mgr: Dependencies resolved.
    mgr: ================================================================================
    mgr:  Package               Architecture    Version            Repository       Size
    mgr: ================================================================================
    mgr: Installing:
    mgr:  epel-release          noarch          8-13.el8           extras           23 k
    mgr:
    mgr: Transaction Summary
    mgr: ================================================================================
    mgr: Install  1 Package
    mgr:
    mgr: Total download size: 23 k
    mgr: Installed size: 35 k
    mgr: Downloading Packages:
    mgr: epel-release-8-13.el8.noarch.rpm                 49 kB/s |  23 kB     00:00
    mgr: --------------------------------------------------------------------------------
    mgr: Total                                            32 kB/s |  23 kB     00:00
    mgr: Running transaction check
    mgr: Transaction check succeeded.
    mgr: Running transaction test
    mgr: Transaction test succeeded.
    mgr: Running transaction
    mgr:   Preparing        :                                                        1/1
    mgr:   Installing       : epel-release-8-13.el8.noarch                           1/1
    mgr:   Running scriptlet: epel-release-8-13.el8.noarch                           1/1
    mgr:   Verifying        : epel-release-8-13.el8.noarch                           1/1
    mgr:
    mgr: Installed:
    mgr:   epel-release-8-13.el8.noarch
    mgr:
    mgr: Complete!

    mgr: Extra Packages for Enterprise Linux 8 - x86_64  8.2 MB/s |  11 MB     00:01
    mgr: Extra Packages for Enterprise Linux Modular 8 - 606 kB/s | 980 kB     00:01
    mgr: Last metadata expiration check: 0:00:01 ago on Sat 18 Dec 2021 12:28:30 AM UTC.
    mgr: Package nfs-utils-1:2.3.3-46.el8.x86_64 is already installed.
    mgr: Dependencies resolved.
    mgr: ================================================================================
    mgr:  Package           Arch   Version                               Repo       Size
    mgr: ================================================================================
    mgr: Installing:
    mgr:  dhcp-server       x86_64 12:4.3.6-45.el8                       baseos    529 k
    mgr:  golang            x86_64 1.16.12-1.module+el8.5.0+720+c057d5cf appstream 687 k
    mgr:  tftp-server       x86_64 5.2-24.el8                            appstream  49 k

    ...<snip>...


    mgr:  pcre2-devel       x86_64 10.32-2.el8                           baseos    604 k
    mgr:  pcre2-utf16       x86_64 10.32-2.el8                           baseos    228 k
    mgr:  pcre2-utf32       x86_64 10.32-2.el8                           baseos    219 k
    mgr: Enabling module streams:
    mgr:  go-toolset               rhel8
    mgr:
    mgr: Transaction Summary
    mgr: ================================================================================
    mgr: Install  16 Packages
    mgr:
    mgr: Total download size: 106 M
    mgr: Installed size: 371 M
    mgr: Downloading Packages:
    mgr: (1/16): golang-1.16.12-1.module+el8.5.0+720+c05 1.2 MB/s | 687 kB     00:00
    mgr: (2/16): tftp-server-5.2-24.el8.x86_64.rpm       348 kB/s |  49 kB     00:00
    mgr: (3/16): golang-src-1.16.12-1.module+el8.5.0+720 6.0 MB/s | 8.2 MB     00:01

    ...<snip>...

    mgr: (14/16): pcre2-utf32-10.32-2.el8.x86_64.rpm     1.4 MB/s | 219 kB     00:00
    mgr: (15/16): openssl-devel-1.1.1k-4.el8.x86_64.rpm  2.5 MB/s | 2.3 MB     00:00
    mgr: (16/16): golang-bin-1.16.12-1.module+el8.5.0+72 7.6 MB/s |  92 MB     00:12
    mgr: --------------------------------------------------------------------------------
    mgr: Total                                           8.4 MB/s | 106 MB     00:12
    mgr: Running transaction check
    mgr: Transaction check succeeded.
    mgr: Running transaction test
    mgr: Transaction test succeeded.
    mgr: Running transaction
    mgr:   Running scriptlet: golang-1.16.12-1.module+el8.5.0+720+c057d5cf.x86_64    1/1
    mgr:   Preparing        :                                                        1/1
    mgr:   Installing       : pcre2-utf32-10.32-2.el8.x86_64                        1/16
    mgr:   Installing       : pcre2-utf16-10.32-2.el8.x86_64                        2/16
    mgr:   Installing       : pcre2-devel-10.32-2.el8.x86_64                        3/16

    ...<snip>...

    mgr:   Verifying        : pcre2-devel-10.32-2.el8.x86_64                       14/16
    mgr:   Verifying        : pcre2-utf16-10.32-2.el8.x86_64                       15/16
    mgr:   Verifying        : pcre2-utf32-10.32-2.el8.x86_64                       16/16
    mgr:
    mgr: Installed:
    mgr:   dhcp-server-12:4.3.6-45.el8.x86_64
    mgr:   golang-1.16.12-1.module+el8.5.0+720+c057d5cf.x86_64
    mgr:   golang-bin-1.16.12-1.module+el8.5.0+720+c057d5cf.x86_64

    ...<snip>...

    mgr:   pcre2-utf16-10.32-2.el8.x86_64
    mgr:   pcre2-utf32-10.32-2.el8.x86_64
    mgr:   tftp-server-5.2-24.el8.x86_64
    mgr:
    mgr: Complete!

==> mgr: Running provisioner: Warewulf v4 Build and Install (shell)...
    mgr: Running: script: Warewulf v4 Build and Install
    mgr: Cloning into 'warewulf'...
    mgr: Note: switching to 'v4.2.0'.
    mgr:
    mgr: You are in 'detached HEAD' state. You can look around, make experimental
    mgr: changes and commit them, and you can discard any commits you make in this
    mgr: state without impacting any branches by switching back to a branch.
    mgr:
    mgr: If you want to create a new branch to retain commits you create, you may
    mgr: do so (now or later) by using -c with the switch command. Example:
    mgr:
    mgr:   git switch -c <new-branch-name>
    mgr:
    mgr: Or undo this operation with:
    mgr:
    mgr:   git switch -
    mgr:
    mgr: Turn off this advice by setting config variable advice.detachedHead to false
    mgr:
    mgr: HEAD is now at 9220e6a Merge pull request #179 from gmkurtzer/overlay_fix
    mgr: go mod tidy -v
    mgr: go: downloading github.com/spf13/cobra v1.1.1
    mgr: go: downloading github.com/pkg/errors v0.9.1

    ...<snip>...

==> mgr: Running provisioner: file...
    mgr: ./mgr/warewulf.conf => /tmp/warewulf.conf

==> mgr: Running provisioner: file...
    mgr: ./mgr/centos-8.def => /tmp/centos-8.def

==> mgr: Running provisioner: Warewulf v4 Configuration (shell)...
    mgr: Running: script: Warewulf v4 Configuration
    mgr: + sudo cp /tmp/warewulf.conf /etc/warewulf/warewulf.conf
    mgr: + sudo systemctl restart firewalld
    mgr: + sudo firewall-cmd --permanent --add-service warewulf
    mgr: success
    mgr: + sudo firewall-cmd --permanent --add-service nfs
    mgr: success
    mgr: + sudo firewall-cmd --permanent --add-service tftp
    mgr: success
    mgr: + sudo firewall-cmd --reload
    mgr: success
    mgr: + sudo groupadd -r warewulf
    mgr: + sudo systemctl daemon-reload
    mgr: + sudo systemctl enable --now warewulfd
    mgr: Created symlink /etc/systemd/system/multi-user.target.wants/warewulfd.service → /usr/lib/systemd/system/warewulfd.service.
    mgr: + sudo wwctl server status
    mgr: Warewulf server is running at PID: 54205
    mgr: + sudo wwctl configure dhcp
    mgr: Writing the DHCP configuration file
    mgr: Enabling and restarting the DHCP services
    mgr: Created symlink /etc/systemd/system/multi-user.target.wants/dhcpd.service → /usr/lib/systemd/system/dhcpd.service.
    mgr: + sudo wwctl configure tftp
    mgr: Writing PXE files to: /var/lib/tftpboot/warewulf
    mgr: Enabling and restarting the TFTP services
    mgr: Created symlink /etc/systemd/system/sockets.target.wants/tftp.socket → /usr/lib/systemd/system/tftp.socket.
    mgr: + sudo wwctl configure nfs
    mgr: Enabling and restarting the NFS services
    mgr: Created symlink /etc/systemd/system/multi-user.target.wants/nfs-server.service → /usr/lib/systemd/system/nfs-server.service.
    mgr: + sudo wwctl configure ssh
    mgr: Updating system keys
    mgr: Setting up key: ssh_host_rsa_key
    mgr: Setting up key: ssh_host_dsa_key
    mgr: Setting up key: ssh_host_ecdsa_key
    mgr: Setting up key: ssh_host_ed25519_key
    mgr: Setting up: /root/.ssh/authorized_keys
    mgr: + sudo systemctl enable --now warewulfd.service
    mgr: + sudo wwctl server status
    mgr: Warewulf server is running at PID: 54205
    mgr: + sudo wwctl container import docker://warewulf/rocky:8 rocky-8 --setdefault
    mgr: Getting image source signatures
    mgr: Copying blob sha256:d7f16ed6f45129c7f4adb3773412def4ba2bf9902de42e86e77379a65d90a984
    mgr: Copying config sha256:da2ca7070439dc5d795d745be57a39ad3d7399a681c20b0eed7a943f1b9ce020
    mgr: Writing manifest to image destination
    mgr: Storing signatures
    mgr: [LOG]       info unpack layer: sha256:d7f16ed6f45129c7f4adb3773412def4ba2bf9902de42e86e77379a65d90a984
    mgr: Updating the container's /etc/resolv.conf
    mgr: Building container: rocky-8
    mgr: Set default profile to container: rocky-8
    mgr: ++ uname -r
    mgr: + sudo wwctl kernel import 4.18.0-348.2.1.el8_5.x86_64 --setdefault
    mgr: 4.18.0-348.2.1.el8_5.x86_64: Done
    mgr: Set default kernel version to: 4.18.0-348.2.1.el8_5.x86_64
    mgr: ++ uname -r
    mgr: + sudo wwctl profile set --yes default --kernel 4.18.0-348.2.1.el8_5.x86_64 --container rocky-8
    mgr: + sudo wwctl profile list --verbose
    mgr: PROFILE NAME         COMMENT/DESCRIPTION
    mgr: ================================================================================
    mgr: default              This profile is automatically included for each node
    mgr: + sudo wwctl node add cn0 --netdev enp0s8 -I 192.168.15.130 --hwaddr 08:00:27:54:8a:84 --type Ethernet
    mgr: [INFO]     Added node: cn0
    mgr: + sudo wwctl node set --yes --netdev enp0s8 --netdefault cn0
    mgr: + sudo wwctl node set --yes --discoverable cn0
    mgr: + sudo wwctl node add cn1 --netdev enp0s8 -I 192.168.15.131 --hwaddr 08:00:27:db:86:d5 --type Ethernet
    mgr: [INFO]     Added node: cn1
    mgr: + sudo wwctl node set --yes --netdev enp0s8 --netdefault cn1
    mgr: + sudo wwctl node set --yes --discoverable cn1
    mgr: + sudo wwctl node list --long
    mgr: NODE NAME              KERNEL                     CONTAINER                           OVERLAYS (S/R)
    mgr: ========================================================================================================================
    mgr: cn0                    4.18.0-348.2.1.el8_5.x86_64 rocky-8                             (default)/(default)
    mgr: cn1                    4.18.0-348.2.1.el8_5.x86_64 rocky-8                             (default)/(default)
    mgr: + sudo wwctl node list --net
    mgr: NODE NAME              DEVICE HWADDR             IPADDR          GATEWAY
    mgr: ================================================================================
    mgr: cn0                    enp0s8 08:00:27:54:8a:84  192.168.15.130  --
    mgr: cn1                    enp0s8 08:00:27:db:86:d5  192.168.15.131  --
    mgr: + sudo wwctl configure hosts
    mgr: + sudo wwctl configure dhcp
    mgr: Writing the DHCP configuration file
    mgr: Enabling and restarting the DHCP services
    mgr: + sudo wwctl overlay import runtime default /etc/shadow /etc/shadow.ww
    mgr: [INFO]     Updating Runtime Overlays...
    mgr: + sudo wwctl overlay mkdir runtime --mode 640 default /etc/sudoers.d
    mgr: + sudo wwctl overlay import runtime --mode 440 default /etc/sudoers.d/vagrant
    mgr: [INFO]     Updating Runtime Overlays...
    mgr: + sudo wwctl overlay build -a
    mgr: [INFO]     Updating System Overlays...
    mgr: [INFO]     Updating Runtime Overlays...

==> mgr: Running provisioner: Warewulf v4 Custom VNFS Creation (shell)...
    mgr: Running: script: Warewulf v4 Custom VNFS Creation
    mgr: + container_name=rocky8
    mgr: + container_build_dir=/home/vagrant/chroots/rocky8
    mgr: + os_release=8
    mgr: + download_url_base=http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r
    mgr: + warewulf_chroot_dir=/var/warewulf/chroots
    mgr: + awk -F= '/^NAME/ {print $2}' /etc/os-release
    mgr: + grep -qi rocky
    mgr: + '[' -d /home/vagrant/chroots/rocky8/rootfs ']'
    mgr: + mkdir -p /home/vagrant/chroots/rocky8/rootfs
    mgr: + cd /home/vagrant/chroots/rocky8
    mgr: + sudo rpm --root=/home/vagrant/chroots/rocky8/rootfs --rebuilddb
    mgr: + rpms_to_download=(rocky-release rocky-repos rocky-gpg-keys)
    mgr: + wget -qp http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/
    mgr: + rpms_to_install=()
    mgr: + for r in "${rpms_to_download[@]}"
    mgr: ++ sort -k1,1V
    mgr: ++ grep rocky-release
    mgr: ++ awk '{print $1}'
    mgr: +++ find . -name index.html
    mgr: ++ tail -n 1
    mgr: ++ sed -e 's/<[^<]*>//g' ./dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/index.html
    mgr: + x=rocky-release-8.5-2.el8.noarch.rpm
    mgr: + wget -p http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-release-8.5-2.el8.noarch.rpm
    mgr: --2021-12-18 00:30:25--  http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-release-8.5-2.el8.noarch.rpm
    mgr: Resolving dl.rockylinux.org (dl.rockylinux.org)... 151.101.198.132, 2a04:4e42:2e::644
    mgr: Connecting to dl.rockylinux.org (dl.rockylinux.org)|151.101.198.132|:80... connected.
    mgr: HTTP request sent, awaiting response... 200 OK
    mgr: Length: 21220 (21K) [application/x-redhat-package-manager]
    mgr: Saving to: ‘dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-release-8.5-2.el8.noarch.rpm’
    mgr:
    mgr:      0K .......... ..........                                 100% 13.4M=0.002s
    mgr:
    mgr: 2021-12-18 00:30:25 (13.4 MB/s) - ‘dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-release-8.5-2.el8.noarch.rpm’ saved [21220/21220]
    mgr:
    mgr: FINISHED --2021-12-18 00:30:25--
    mgr: Total wall clock time: 0.1s
    mgr: Downloaded: 1 files, 21K in 0.002s (13.4 MB/s)
    mgr: + for r in "${rpms_to_download[@]}"
    mgr: +++ find . -name index.html
    mgr: ++ grep rocky-repos
    mgr: ++ sort -k1,1V
    mgr: ++ awk '{print $1}'
    mgr: ++ tail -n 1
    mgr: ++ sed -e 's/<[^<]*>//g' ./dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/index.html
    mgr: + x=rocky-repos-8.5-2.el8.noarch.rpm
    mgr: + wget -p http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-repos-8.5-2.el8.noarch.rpm
    mgr: --2021-12-18 00:30:25--  http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-repos-8.5-2.el8.noarch.rpm
    mgr: Resolving dl.rockylinux.org (dl.rockylinux.org)... 151.101.198.132, 2a04:4e42:2e::644
    mgr: Connecting to dl.rockylinux.org (dl.rockylinux.org)|151.101.198.132|:80... connected.
    mgr: HTTP request sent, awaiting response... 200 OK
    mgr: Length: 13724 (13K) [application/x-redhat-package-manager]
    mgr: Saving to: ‘dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-repos-8.5-2.el8.noarch.rpm’
    mgr:
    mgr:      0K .......... ...                                        100% 8.27M=0.002s
    mgr:
    mgr: 2021-12-18 00:30:25 (8.27 MB/s) - ‘dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-repos-8.5-2.el8.noarch.rpm’ saved [13724/13724]
    mgr:
    mgr: FINISHED --2021-12-18 00:30:25--
    mgr: Total wall clock time: 0.06s
    mgr: Downloaded: 1 files, 13K in 0.002s (8.27 MB/s)
    mgr: + for r in "${rpms_to_download[@]}"
    mgr: ++ sort -k1,1V
    mgr: ++ grep rocky-gpg-keys
    mgr: ++ awk '{print $1}'
    mgr: +++ find . -name index.html
    mgr: ++ tail -n 1
    mgr: ++ sed -e 's/<[^<]*>//g' ./dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/index.html
    mgr: + x=rocky-gpg-keys-8.5-2.el8.noarch.rpm
    mgr: + wget -p http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-gpg-keys-8.5-2.el8.noarch.rpm
    mgr: --2021-12-18 00:30:25--  http://dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-gpg-keys-8.5-2.el8.noarch.rpm
    mgr: Resolving dl.rockylinux.org (dl.rockylinux.org)... 151.101.198.132, 2a04:4e42:2e::644
    mgr: Connecting to dl.rockylinux.org (dl.rockylinux.org)|151.101.198.132|:80... connected.
    mgr: HTTP request sent, awaiting response... 200 OK
    mgr: Length: 11900 (12K) [application/x-redhat-package-manager]
    mgr: Saving to: ‘dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-gpg-keys-8.5-2.el8.noarch.rpm’
    mgr:
    mgr:      0K .......... .                                          100% 13.6M=0.001s
    mgr:
    mgr: 2021-12-18 00:30:25 (13.6 MB/s) - ‘dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-gpg-keys-8.5-2.el8.noarch.rpm’ saved [11900/11900]
    mgr:
    mgr: FINISHED --2021-12-18 00:30:25--
    mgr: Total wall clock time: 0.06s
    mgr: Downloaded: 1 files, 12K in 0.001s (13.6 MB/s)
    mgr: + mapfile -t rpms_to_install
    mgr: ++ find /home/vagrant/chroots/rocky8 -name 'rocky*.rpm' -type f
    mgr: + sudo rpm --root=/home/vagrant/chroots/rocky8/rootfs --nodeps -i /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-release-8.5-2.el8.noarch.rpm /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-repos-8.5-2.el8.noarch.rpm /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-gpg-keys-8.5-2.el8.noarch.rpm
    mgr: warning: /home/vagrant/chroots/rocky8/dl.rockylinux.org/pub/rocky/8/BaseOS/x86_64/os/Packages/r/rocky-release-8.5-2.el8.noarch.rpm: Header V4 RSA/SHA256 Signature, key ID 6d745a60: NOKEY
    mgr: + sudo dnf --refresh --installroot /home/vagrant/chroots/rocky8/rootfs install -y basesystem bash chkconfig coreutils cpio cronie crontabs curl dhclient dnf e2fsprogs ethtool filesystem findutils fipscheck fipscheck-lib gawk grep gzip initscripts ipmitool iproute iputils less libndp net-tools NetworkManager NetworkManager-libnm nfs-utils openssh-clients openssh-server pam pciutils polkit-libs psmisc rsync rsyslog sed setup shadow-utils strace sudo tar tzdata util-linux vim-minimal wget which words zlib
    mgr: Rocky Linux 8 - AppStream                       7.4 MB/s | 8.5 MB     00:01
    mgr: Rocky Linux 8 - BaseOS                          2.7 MB/s | 3.6 MB     00:01
    mgr: Rocky Linux 8 - Extras                           13 kB/s |  10 kB     00:00
    mgr: Dependencies resolved.
    mgr: =========================================================================================
    mgr:  Package                       Arch    Version                           Repo        Size
    mgr: =========================================================================================
    mgr: Installing:
    mgr:  NetworkManager                x86_64  1:1.32.10-4.el8                   baseos     2.6 M
    mgr:  NetworkManager-libnm          x86_64  1:1.32.10-4.el8                   baseos     1.8 M
    mgr:  basesystem                    noarch  11-5.el8                          baseos     9.3 k

    ...<snip>...

    mgr:  rpm-plugin-systemd-inhibit    x86_64  4.14.3-19.el8                     baseos      77 k
    mgr:  shared-mime-info              x86_64  1.9-3.el8                         baseos     328 k
    mgr:  trousers                      x86_64  0.3.15-1.el8                      baseos     151 k
    mgr:
    mgr: Transaction Summary
    mgr: =========================================================================================
    mgr: Install  256 Packages
    mgr:
    mgr: Total download size: 152 M
    mgr: Installed size: 834 M
    mgr: Downloading Packages:
    mgr: (1/256): ipmitool-1.8.18-18.el8.x86_64.rpm      310 kB/s | 394 kB     00:01
    mgr: (2/256): libestr-0.1.10-1.el8.x86_64.rpm        106 kB/s |  26 kB     00:00
    mgr: (3/256): libfastjson-0.99.9-1.el8.x86_64.rpm    108 kB/s |  37 kB     00:00

    ...<snip>...

    mgr: (254/256): xz-5.2.4-3.el8.1.x86_64.rpm          1.0 MB/s | 152 kB     00:00
    mgr: (255/256): xz-libs-5.2.4-3.el8.1.x86_64.rpm     847 kB/s |  93 kB     00:00
    mgr: (256/256): zlib-1.2.11-17.el8.x86_64.rpm        1.1 MB/s | 101 kB     00:00
    mgr: --------------------------------------------------------------------------------
    mgr: Total                                           7.4 MB/s | 152 MB     00:20
    mgr: Rocky Linux 8 - AppStream                       1.6 MB/s | 1.6 kB     00:00
    mgr: Importing GPG key 0x6D745A60:
    mgr:  Userid     : "Release Engineering <infrastructure@rockylinux.org>"
    mgr:  Fingerprint: 7051 C470 A929 F454 CEBE 37B7 15AF 5DAC 6D74 5A60
    mgr:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
    mgr: Key imported successfully
    mgr: Running transaction check
    mgr: Transaction check succeeded.
    mgr: Running transaction test
    mgr: Transaction test succeeded.
    mgr: Running transaction
    mgr:   Running scriptlet: filesystem-3.8-6.el8.x86_64                            1/1
    mgr:   Preparing        :                                                        1/1
    mgr:   Installing       : libgcc-8.5.0-4.el8_5.x86_64                          1/256
    mgr:   Running scriptlet: libgcc-8.5.0-4.el8_5.x86_64                          1/256

...<snip>...

    mgr:   Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                  256/256
    mgr:   Running scriptlet: systemd-239-51.el8_5.3.x86_64                      256/256
    mgr:   Running scriptlet: systemd-udev-239-51.el8_5.3.x86_64                 256/256
    mgr:   Verifying        : geolite2-city-20180605-1.el8.noarch                  1/256
    mgr:   Verifying        : geolite2-country-20180605-1.el8.noarch               2/256
    mgr:   Verifying        : ipmitool-1.8.18-18.el8.x86_64                        3/256

...<snip>...

    mgr:   Verifying        : xz-5.2.4-3.el8.1.x86_64                            254/256
    mgr:   Verifying        : xz-libs-5.2.4-3.el8.1.x86_64                       255/256
    mgr:   Verifying        : zlib-1.2.11-17.el8.x86_64                          256/256
    mgr:
    mgr: Installed:
    mgr:   NetworkManager-1:1.32.10-4.el8.x86_64
    mgr:   NetworkManager-libnm-1:1.32.10-4.el8.x86_64
    mgr:   acl-2.2.53-1.el8.1.x86_64

...<snip>...

    mgr:   xz-5.2.4-3.el8.1.x86_64
    mgr:   xz-libs-5.2.4-3.el8.1.x86_64
    mgr:   zlib-1.2.11-17.el8.x86_64
    mgr:
    mgr: Complete!
    mgr: + sudo mkdir -p /var/warewulf/chroots/rocky8
    mgr: + cd /home/vagrant/chroots/rocky8
    mgr: + sudo tar -cf - ./rootfs
    mgr: + cd /var/warewulf/chroots/rocky8
    mgr: + sudo tar -xf -
    mgr: + sudo wwctl container build --force rocky8
    mgr: + sudo wwctl container list
    mgr: CONTAINER NAME                      BUILT  NODES
    mgr: rocky-8                             true   2
    mgr: rocky8                              true   0
    mgr: + set +e
    mgr: + sudo wwctl profile list
    mgr: + grep -q -E '^rocky8 '
    mgr: + ret=1
    mgr: + set -e
    mgr: + [[ 1 -eq 0 ]]
    mgr: + sudo wwctl profile add rocky8
    mgr: + sudo wwctl profile set --yes --container rocky8 rocky8
    mgr: + sudo wwctl profile set --yes --comment 'This profile provides rocky8 VNFS' rocky8
    mgr: ++ uname -r
    mgr: + sudo wwctl profile set --yes --kernel 4.18.0-348.2.1.el8_5.x86_64 rocky8
    mgr: + sudo wwctl node set --yes --addprofile rocky8 cn0
    mgr: + sudo wwctl node set --yes --addprofile rocky8 cn1
    mgr: + sudo wwctl node list --long
    mgr: NODE NAME              KERNEL                     CONTAINER                           OVERLAYS (S/R)
    mgr: ========================================================================================================================
    mgr: cn0                    4.18.0-348.2.1.el8_5.x86_64 rocky8                              (default)/(default)
    mgr: cn1                    4.18.0-348.2.1.el8_5.x86_64 rocky8                              (default)/(default)
==> cn0: Importing base box 'onyxpoint/empty'...
==> cn0: Matching MAC address for NAT networking...
==> cn0: Checking if box 'onyxpoint/empty' version '1.0.0' is up to date...
==> cn0: Setting the name of the VM: warewulf-vagrant_cn0_1639787506910_74213
==> cn0: Clearing any previously set network interfaces...
==> cn0: Preparing network interfaces based on configuration...
    cn0: Adapter 1: nat
    cn0: Adapter 2: hostonly
==> cn0: Forwarding ports...
    cn0: 22 (guest) => 2222 (host) (adapter 1)
==> cn0: Running 'pre-boot' VM customizations...
==> cn0: Booting VM...
==> cn0: Waiting for machine to boot. This may take a few minutes...
    cn0: SSH address: 127.0.0.1:2222
    cn0: SSH username: vagrant
    cn0: SSH auth method: private key
    cn0: Warning: Authentication failure. Retrying...
==> cn0: Machine booted and ready!
==> cn1: Importing base box 'onyxpoint/empty'...
==> cn1: Matching MAC address for NAT networking...
==> cn1: Checking if box 'onyxpoint/empty' version '1.0.0' is up to date...
==> cn1: Setting the name of the VM: warewulf-vagrant_cn1_1639787546171_28762
==> cn1: Fixed port collision for 22 => 2222. Now on port 2201.
==> cn1: Clearing any previously set network interfaces...
==> cn1: Preparing network interfaces based on configuration...
    cn1: Adapter 1: nat
    cn1: Adapter 2: hostonly
==> cn1: Forwarding ports...
    cn1: 22 (guest) => 2201 (host) (adapter 1)
==> cn1: Running 'pre-boot' VM customizations...
==> cn1: Booting VM...
==> cn1: Waiting for machine to boot. This may take a few minutes...
    cn1: SSH address: 127.0.0.1:2201
    cn1: SSH username: vagrant
    cn1: SSH auth method: private key
    cn1: Warning: Authentication failure. Retrying...
==> cn1: Machine booted and ready!
Fri Dec 17 16:01:05 PST 2021
```

| Start, End, Elapsed | Timestamp, Delta             |
| ------------------- | ---------------------------- |
| **Start:**          | Fri Dec 17 16:23:00 PST 2021 |
| **End:**            | Fri Dec 17 16:33:04 PST 2021 |
| **Elapsed:**        | 10 mins, 4 secs              |


## vagrant status

```
➜  warewulf-vagrant git:(main) ✗ vagrant status
Current machine states:

mgr                       running (virtualbox)
cn0                       running (virtualbox)
cn1                       running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```


## vagrant halt

```
➜  warewulf-vagrant git:(main) ✗ vagrant halt
==> cn1: Attempting graceful shutdown of VM...
==> cn0: Attempting graceful shutdown of VM...
==> mgr: Attempting graceful shutdown of VM...
```


## vagrant destroy --parallel

```
➜  warewulf-vagrant git:(main) ✗ vagrant destroy --parallel
Destroying guests with `--parallel` automatically enables `--force`.
Press ctrl-c to cancel.
==> cn1: Destroying VM and associated drives...
==> cn0: Destroying VM and associated drives...
==> mgr: Running cleanup tasks for 'reload' provisioner...
==> mgr: Destroying VM and associated drives...
```
