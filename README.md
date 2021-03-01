# Warewulf v4 Provisioning in VirtualBox with Vagrant

## Introduction

Vagrant project to provision a Warewulf v4 cluster running CentOS 8.

- `mgr` - warewulf headnode
- `cn0` - warewulf compute node 0
- `cn1` - warewulf compute node 1

## Quick Start

If you don't want to reconfigure anything and just want to bring up the manager node and some compute nodes then:

### Setup the headnode

```
./bootstrap.sh
vagrant up mgr
```

### Provision the compute nodes

```
vagrant up cn0
vagrant up cn1
```

### Play with Warewulf v4

```
vagrant ssh mgr
```

### Throw it all away

```
vagrant destroy
```

## Advanced Startup

If you want to modify the compute node configuration by tweaking the warewulf overlays then:
