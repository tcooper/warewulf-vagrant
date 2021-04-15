# Warewulf v4 Provisioning in VirtualBox with Vagrant

## Introduction

Vagrant project to provision a Warewulf v4 cluster running CentOS 8.

- `mgr` - warewulf headnode
- `cn0` - warewulf compute node 0
- `cn1` - warewulf compute node 1

## Prerequisites

You need working VirtualBox and Vagrant installations to use this repository.

All capabilities were developed and tested with:

* macOS 11.2.3
* Oracle VirtualBox 6.1.18 r142142 (without VirtualBox 6.1.18 Oracle VM VirtualBox Extension Pack), and
* Vagrant 2.2.15

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
*   Install of Warewulf v4 based on the [Quick Start for RHEL, CentOS and Rocky 8](https://docs.ctrliq.com/warewulf/docs/getting-started/quickstart-el8) is handled in [`mgr/warewulf_install.sh`](./mgr/warewulf_install.sh)
*   Configuration based on the [Quick Start for RHEL, CentOS and Rocky 8](https://docs.ctrliq.com/warewulf/docs/getting-started/quickstart-el8) is handled in [`mgr/warewulf_config.sh`](./mgr/warewulf_config.sh)
*   Customization through creation of a second container image using [Singularity CE](https://sylabs.io/singularity/) is handled in [`mgr/warewulf_container.sh`](./mgr/warewulf_container.sh)
