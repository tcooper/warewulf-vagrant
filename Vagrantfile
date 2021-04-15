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
      vb.gui = cfg["mgr_gui"]

      # let vagrant known that the guest does not have the guest additions nor a functional vboxsf or shared folders.
      vb.check_guest_additions = false
      vb.functional_vboxsf = false
      vb.default_nic_type = "virtio"

      # Various VirtualBox Customizations
      vb.customize ["modifyvm", :id, "--firmware", cfg["mgr_firmware"]]
      vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga", "--vram", "128"]
      vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
      vb.customize ["modifyvm", :id, "--vrde", "off"]
      vb.customize ["modifyvm", :id, "--audio", "none"]
      vb.customize ["modifyvm", :id, "--clipboard", "disabled", "--draganddrop", "disabled"]
      vb.customize ["modifyvm", :id, "--mouse", "usb", "--keyboard", "usb"]
      vb.customize ["modifyvm", :id, "--recording", cfg["mgr_recording_state"]]
      vb.customize ["modifyvm", :id, "--recordingmaxtime", cfg["mgr_recording_time"]]
      vb.customize ["modifyvm", :id, "--recordingfile", "./mgr.webm"]
    end

    # NOTE: Configuration sequence from https://warewulf.readthedocs.io/en/latest/getting-started/quickstart-rocky8.html
    #config.vm.provision "file", source: "~/.vagrant.d/insecure_private_key", destination: "/vagrant/tmp/keys/ssh_private"
    mgr.vm.provision "shell", :path => "./mgr/warewulf_pre.sh"
    mgr.vm.provision :reload
    mgr.vm.provision "shell", :path => "./mgr/warewulf_install.sh"
    mgr.vm.provision "file",  source: "./mgr/warewulf.conf", destination: "/tmp/warewulf.conf"
    mgr.vm.provision "shell", :path => "./mgr/warewulf_config.sh"
    mgr.vm.provision "shell", :path => "./mgr/warewulf_container.sh"
  end

  cfg["compute_count"].times do |index|
    COMPUTE_NAME = "cn#{index}"

    config.vm.define COMPUTE_NAME, autostart: true do |config|

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
        vb.gui = cfg["compute_gui"]

        # let vagrant known that the guest does not have the guest additions nor a functional vboxsf or shared folders.
        vb.check_guest_additions = false
        vb.functional_vboxsf = false

        # Various VirtualBox Customizations
        vb.customize ["modifyvm", :id, "--firmware", cfg["cn#{index}_firmware"]]
        vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga", "--vram", "128"]
        vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        vb.customize ["modifyvm", :id, "--vrde", "off"]
        vb.customize ["modifyvm", :id, "--audio", "none"]
        vb.customize ["modifyvm", :id, "--clipboard", "disabled", "--draganddrop", "disabled"]
        vb.customize ["modifyvm", :id, "--mouse", "usb", "--keyboard", "usb"]
        vb.customize ["modifyvm", :id, "--recording", cfg["compute_recording_state"]]
        vb.customize ["modifyvm", :id, "--recordingmaxtime", cfg["compute_recording_time"]]
        vb.customize ["modifyvm", :id, "--recordingfile", "./cn#{index}.webm"]

        # Attach in iPXE ISO that provides bzImage support
        # If we get chainloading working this will not be required
        # If you switch to efi firmware this device attachment will fail, add conditional based on cfg["compute_firmware"] specification
        vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "1", "--type", "dvddrive", "--medium", cfg["compute_iso"]]

        # Configure for PXE boot
        #vb.customize ['modifyvm', :id, '--boot1', 'net'] # Default PXE boot will not work with VB PXI ROM, no support for bzImage
        vb.customize ['modifyvm', :id, '--boot1', 'dvd'] # Boot from mounted iPXE ISO in virtual DVD drive
        vb.customize ['modifyvm', :id, '--boot2', 'disk']
        vb.customize ['modifyvm', :id, '--biospxedebug', 'on']
        vb.customize ["modifyvm", :id, "--macaddress1", cfg["cn#{index}_nic1_mac"]]
        vb.customize ["modifyvm", :id, "--macaddress2", cfg["cn#{index}_nic2_mac"]]
        vb.customize ['modifyvm', :id, '--cableconnected2', 'on']
        vb.customize ['modifyvm', :id, '--nicbootprio2', '1']
        vb.customize ['modifyvm', :id, "--nictype2", '82540EM'] # Must be an Intel card (as-of VB 5.1 we cannot Intel PXE boot from a virtio-net card).

      end
    end
  end
end
