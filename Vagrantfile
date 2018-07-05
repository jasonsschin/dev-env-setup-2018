# -*- mode: ruby -*-
# vi: set ft=ruby :

$devenv = <<'DEVENV'
$script = ((Get-Content -Path 'z:\install-extra.ps1')) | Invoke-Expression 
DEVENV

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
  config.vm.define "vagrant-windows-10"
  config.vm.box = "windows10"
  config.vm.boot_timeout = 400
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  # this will require a restart:
  config.vm.hostname = "VM-DEV18"

  # forward RDP and WINRS ports
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

  config.windows.set_work_network = true
  config.winrm.max_tries = 10
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"

  # Share an additional folder to the guest VM.
  # The first argument is the path on the host to the actual folder.
  # The second argument is the path on the guest to mount the folder.
  # And the optional third argument is a set of non-required options.
  config.vm.synced_folder "~/downloads", "/Downloads"
  config.vm.synced_folder "~/Projects", "/Projects"

  config.vm.provider "parallels" do |v|
    v.name = "VM-DEV18"
    v.update_guest_tools = true
    v.optimize_power_consumption = false
    v.memory = 8192
    v.cpus = 2
    v.customize ["set", :id, "--device-set=hdd0", "--size=100G", "--no-fs-resize" ]
  end


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
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  #config.vm.provision :shell, :inline => $devenv
  config.vm.provision :shell, :path => "./scripts/Bootstrap.ps1"
  #config.vm.provision :shell, :path => "./scripts/Enable-Windows-Features.cmd"
  config.vm.provision :shell, :path => "./scripts/Set-DvdDrvLetter.ps1"
  #config.vm.provision :shell, :path => "./scripts/Install-Tools.ps1"
  config.vm.provision :shell, :path => "./scripts/Remap-Vagrant-Shares.ps1"
  config.vm.provision :shell, :path => "./scripts/Create-Required-Folders.ps1"

end
