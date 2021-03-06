# Warewulf v4 Provisioning in VirtualBox with Vagrant

## Introduction

Vagrant project to provision a Warewulf v4 cluster running CentOS 8.

- `mgr` - warewulf headnode
- `cn0` - warewulf compute node 0
- `cn1` - warewulf compute node 1

## Prerequisites

You need working VirtualBox and Vagrant installations to use this repository.

All capabilities were developed and tested with:

* macOS 21.0.1
* Oracle VirtualBox 6.1.30 r148432 (without VirtualBox 6.1.30 Oracle VM VirtualBox Extension Pack), and
* Vagrant 2.2.19

## Quick Start

If you don't want to (re)configure anything and just want to bring up the manager node and some compute nodes then:

### Provision everything in one go...

```
./bootstrap.sh
vagrant up
```

In testing, the entire 3 node cluster was fully provisioned and running in under 9 minutes with manager node install and configuration taking the bulk (8 minutes) of that time. Compute nodes boot diskless in under a minute.

## Tips

*   Preparation of the base system is handled in [`mgr/warewulf_pre.sh`](./mgr/warewulf_pre.sh)
*   Install of Warewulf v4 based on the [EL8 Quickstart (Rocky and RHEL)](https://warewulf.hpcng.org/docs/quickstart/el8) is handled in [`mgr/warewulf_install.sh`](./mgr/warewulf_install.sh)
*   Configuration based on the [EL8 Quickstart (Rocky and RHEL)](https://warewulf.hpcng.org/docs/quickstart/el8) is handled in [`mgr/warewulf_config.sh`](./mgr/warewulf_config.sh)
*   Customization through creation of a second container image using [Singularity](https://github.com/hpcng/singularity/) is handled in [`mgr/warewulf_container.sh`](./mgr/warewulf_container.sh)

## Important

*   VirtualBox 6.1.28 introduced a change that breaks this deployement without modification to the host configuration that will not be corrected by `bootstrap.sh`. Follow the instructions in the [Host-Only Networking](https://www.virtualbox.org/manual/ch06.html#network_hostonly) section of the VirtualBox user guide for instructions for configuration of `/etc/vbox/networks.conf`.
