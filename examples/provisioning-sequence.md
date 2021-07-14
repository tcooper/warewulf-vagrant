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
Wed Jul  7 11:41:51 PDT 2021
Bringing machine 'mgr' up with 'virtualbox' provider...
Bringing machine 'cn0' up with 'virtualbox' provider...
Bringing machine 'cn1' up with 'virtualbox' provider...
==> mgr: Importing base box 'rockylinux/8'...
==> mgr: Matching MAC address for NAT networking...
==> mgr: Checking if box 'rockylinux/8' version '4.0.0' is up to date...
==> mgr: Setting the name of the VM: warewulf-vagrant_mgr_1625683324309_11319
==> mgr: Clearing any previously set network interfaces...
==> mgr: Preparing network interfaces based on configuration...
    mgr: Adapter 1: nat
    mgr: Adapter 2: hostonly
==> mgr: Forwarding ports...
    mgr: 22 (guest) => 2222 (host) (adapter 1)
==> mgr: Running 'pre-boot' VM customizations...
==> mgr: Booting VM...
==> mgr: Waiting for machine to boot. This may take a few minutes...
    mgr: SSH address: 127.0.0.1:2222
    mgr: SSH username: vagrant
    mgr: SSH auth method: private key

...<snip>...

==> mgr: Machine booted and ready!
==> mgr: Setting hostname...
==> mgr: Configuring and enabling network interfaces...
==> mgr: Running provisioner: Warewulf v4 Pre-Install Host Setup (shell)...
    mgr: Running: script: Warewulf v4 Pre-Install Host Setup

...<snip>...

    mgr: Complete!
    mgr:
    mgr: 192.168.15.15    mgr.example.com mgr
==> mgr: Running provisioner: reload...
==> mgr: Attempting graceful shutdown of VM...
==> mgr: Checking if box 'rockylinux/8' version '4.0.0' is up to date...
==> mgr: Clearing any previously set forwarded ports...
==> mgr: Clearing any previously set network interfaces...
==> mgr: Preparing network interfaces based on configuration...
    mgr: Adapter 1: nat
    mgr: Adapter 2: hostonly
==> mgr: Forwarding ports...
    mgr: 22 (guest) => 2222 (host) (adapter 1)
==> mgr: Running 'pre-boot' VM customizations...
==> mgr: Booting VM...
==> mgr: Waiting for machine to boot. This may take a few minutes...
==> mgr: Machine booted and ready!
==> mgr: Setting hostname...
==> mgr: Configuring and enabling network interfaces...
==> mgr: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> mgr: flag to force provisioning. Provisioners marked to run always will still run.
==> mgr: Running provisioner: Warewulf v4 Build and Install (shell)...
    mgr: Running: script: Warewulf v4 Build and Install
    mgr: Last metadata expiration check: 0:01:20 ago on Wed 07 Jul 2021 06:42:33 PM UTC.
    mgr: Dependencies resolved.

...<snip>...

mgr: mkdir -p /usr/lib/systemd/system
mgr: install -c -m 0644 include/firewalld/warewulf.xml /usr/lib/firewalld/services
mgr: install -c -m 0644 include/systemd/warewulfd.service /usr/lib/systemd/system
mgr: systemctl daemon-reload
==> mgr: Running provisioner: file...
mgr: ./mgr/warewulf.conf => /tmp/warewulf.conf
==> mgr: Running provisioner: file...
mgr: ./mgr/centos-8.def => /tmp/centos-8.def
==> mgr: Running provisioner: Warewulf v4 Configuration (shell)...
mgr: Running: script: Warewulf v4 Configuration
mgr: + sudo cp /tmp/warewulf.conf /etc/warewulf/warewulf.conf
mgr: + sudo wwctl configure dhcp
mgr: [INFO]     2021/07/07 18:46:19 Created default node configuration

...<snip>...

mgr: + sudo wwctl ready
mgr: NODE NAME                 STATUS     VNFS   KERNEL KMODS  SYS-OL RUN-OL
mgr: cn0                       true       true   true   true   true   true
mgr: cn1                       true       true   true   true   true   true
mgr: + sudo wwctl server start
mgr: + sudo wwctl server status
mgr: Warewulf daemon is running at PID: 32557
==> mgr: Running provisioner: Warewulf v4 Custom VNFS Creation (shell)...
mgr: Running: script: Warewulf v4 Custom VNFS Creation
mgr: + container_name=rocky8
mgr: + container_build_dir=/home/vagrant/chroots/rocky8

...<snip>...

mgr:
mgr: Complete!
mgr: + sudo mkdir -p /var/warewulf/chroots/rocky8
mgr: + cd /home/vagrant/chroots/rocky8
mgr: + sudo tar -cf - ./rootfs
mgr: + cd /var/warewulf/chroots/rocky8
mgr: + sudo tar -xf -
mgr: + sudo wwctl container build --force rocky8
mgr: + sudo wwctl container list
mgr: VNFS NAME                           BUILT  NODES
mgr: centos8                             true   2
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
mgr: + sudo wwctl profile set --yes --kernel 4.18.0-305.7.1.el8_4.x86_64 rocky8
mgr: + sudo wwctl node set --yes --addprofile rocky8 cn0
mgr: + sudo wwctl node set --yes --addprofile rocky8 cn1
mgr: + sudo wwctl node list --long
mgr: NODE NAME              KERNEL VERSION             CONTAINER                           OVERLAYS (S/R)
mgr: ========================================================================================================================
mgr: cn0                    4.18.0-305.7.1.el8_4.x86_64 rocky8                              (default)/(default)
mgr: cn1                    4.18.0-305.7.1.el8_4.x86_64 rocky8                              (default)/(default)
==> cn0: Importing base box 'onyxpoint/empty'...
==> cn0: Matching MAC address for NAT networking...
==> cn0: Checking if box 'onyxpoint/empty' version '1.0.0' is up to date...
==> cn0: Setting the name of the VM: warewulf-vagrant_cn0_1625683721627_80555
==> cn0: Fixed port collision for 22 => 2222. Now on port 2200.
==> cn0: Clearing any previously set network interfaces...
==> cn0: Preparing network interfaces based on configuration...
    cn0: Adapter 1: nat
    cn0: Adapter 2: hostonly
==> cn0: Forwarding ports...
    cn0: 22 (guest) => 2200 (host) (adapter 1)
==> cn0: Running 'pre-boot' VM customizations...
==> cn0: Booting VM...
==> cn0: Waiting for machine to boot. This may take a few minutes...
    cn0: SSH address: 127.0.0.1:2200
    cn0: SSH username: vagrant
    cn0: SSH auth method: private key
==> cn0: Machine booted and ready!
==> cn1: Importing base box 'onyxpoint/empty'...
==> cn1: Matching MAC address for NAT networking...
==> cn1: Checking if box 'onyxpoint/empty' version '1.0.0' is up to date...
==> cn1: Setting the name of the VM: warewulf-vagrant_cn1_1625683766136_71049
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
==> cn1: Machine booted and ready!
Wed Jul  7 11:50:10 PDT 2021
```

| Start, End, Elapsed | Timestamp, Delta             |
| ------------------- | ---------------------------- |
| **Start:**          | Wed Jul  7 11:41:51 PDT 2021 |
| **End:**            | Wed Jul  7 11:50:10 PDT 2021 |
| **Elapsed:**        | 8 mins, 21 secs              |


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
==> cn1: Forcing shutdown of VM...
==> cn1: Destroying VM and associated drives...
==> cn0: Forcing shutdown of VM...
==> cn0: Destroying VM and associated drives...
==> mgr: Running cleanup tasks for 'reload' provisioner...
==> mgr: Forcing shutdown of VM...
==> mgr: Destroying VM and associated drives...
```
