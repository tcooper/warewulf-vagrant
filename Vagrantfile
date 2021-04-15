# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.2.14"

require 'yaml'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# configs, custom updates defaults
defaults_cfg = YAML.load_file('vagrant-settings.yaml_defaults')
if File.exist?('vagrant-settings.yaml')
  custom_cfg = YAML.load_file('vagrant-settings.yaml')
  cfg = defaults_cfg.merge(custom_cfg)
else
  cfg = defaults_cfg
end

Vagrant.configure(2) do |config|

  config.vm.define "mgr", primary: true, autostart: true do |mgr|
    mgr.vm.boot_timeout = 300
    mgr.vm.box = cfg["mgr_image"]
    mgr.vm.hostname = "mgr.example.com"

    mgr.vm.network "private_network", ip: cfg["mgr_nic1_ip"]

    mgr.vm.provider "virtualbox" do |vb|
      vb.memory = cfg["mgr_ram"]
      vb.cpus = cfg["mgr_cpus"]
      vb.gui = true
    end

    # NOTE: Configuration sequence from https://warewulf.readthedocs.io/en/latest/getting-started/quickstart-rocky8.html
    #config.vm.provision "file", source: "~/.vagrant.d/insecure_private_key", destination: "/vagrant/tmp/keys/ssh_private"
    mgr.vm.provision "shell", :path => "./mgr/warewulf_pre.sh"
    mgr.vm.provision "shell", :path => "./mgr/warewulf_install.sh"
    mgr.vm.provision "file",  source: "./mgr/warewulf.conf", destination: "/tmp/warewulf.conf"
    mgr.vm.provision "shell", :path => "./mgr/warewulf_config.sh"
  end

  cfg["compute_count"].times do |index|
    COMPUTE_NAME = "cn#{index}"

    config.vm.define COMPUTE_NAME, autostart: false do |config|

      config.vm.boot_timeout = 300
      config.vm.box = cfg["compute_image"]

      # warewulf will deploy these via overlays
      config.ssh.insert_key = false
      config.ssh.private_key_path = ".vagrant/machines/mgr/virtualbox/private_key"
      config.vm.allow_fstab_modification = false
      config.vm.allow_hosts_modification = false
      config.vm.synced_folder '.', '/vagrant', disabled: true


      config.vm.network "private_network", ip: cfg["cn#{index}_nic2_ip"], auto_config: false
      config.vm.provider "virtualbox" do |vb|
        vb.memory = cfg["compute_ram"]
        vb.cpus = cfg["compute_cpus"]
        vb.gui = true

        # let vagrant known that the guest does not have the guest additions nor a functional vboxsf or shared folders.
        vb.check_guest_additions = false
        vb.functional_vboxsf = false

        # Attach in iPXE ISO that provides bzImage support
        vb.customize ["modifyvm", :id, "--boot1", "dvd", "--boot2", "disk", "--macaddress1", cfg["cn#{index}_nic1_mac"], "--macaddress2", cfg["cn#{index}_nic2_mac"]]
        vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "1", "--type", "dvddrive", "--medium", cfg["compute_iso"]]
      end
    end
  end
end
