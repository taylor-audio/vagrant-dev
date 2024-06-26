# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-20.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      # vb.gui = true
  
      # Customize the amount of memory on the VM:
      vb.memory = "2048"

      # Use 1 CPU
      vb.cpus = 1

      # Enable all USB devices needed for development
      vb.customize ['modifyvm', :id, '--usb', 'on']
      vb.customize ['modifyvm', :id, '--usbehci', 'on']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'STLink', '--vendorid', '0x0483', '--productid', '0x3748']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'Olimex OpenOCD JTAG ARM-USB-TINY-H', '--vendorid', '0x15BA', '--productid', '0x002a']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'Olimex OpenOCD JTAG ARM-USB-OCD-H', '--vendorid', '0x15BA', '--productid', '0x002b']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'Olimex OpenOCD JTAG', '--vendorid', '0x15BA', '--productid', '0x0003']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'AVRISP mkII', '--vendorid', '0x03EB', '--productid', '0x2104']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'Atmel-ICE', '--vendorid', '0x03EB', '--productid', '0x2141']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'FTDI serial adapter', '--vendorid', '0x0403', '--productid', '0x6001']
      vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'Arduino Uno', '--vendorid', '0x2341', '--productid', '0x0001']
  end

  # Provisioning
  config.vm.provision :shell, path: "initialize.sh"

  config.vm.provision :shell, path: "install-drivers.sh"
  config.vm.provision :shell, path: "install-git.sh"
  config.vm.provision :shell, path: "install-python.sh"
  config.vm.provision :shell, path: "install-unzip.sh"
  config.vm.provision :shell, path: "install-usbutils.sh"

  config.vm.provision :shell, path: "install-toolchain-basic.sh"
  config.vm.provision :shell, path: "install-toolchain-avr.sh"
  config.vm.provision :shell, path: "install-toolchain-arm.sh"
  config.vm.provision :shell, path: "install-toolchain-xdk-asf.sh"
  
  config.vm.provision :shell, path: "compile-openocd.sh"
  config.vm.provision :shell, path: "compile-stlink.sh"

  config.vm.provision :shell, path: "setup-usb-devices.sh"
  config.vm.provision :shell, path: "setup-bashrc.sh"
  config.vm.provision :shell, path: "setup-git.sh"
end
