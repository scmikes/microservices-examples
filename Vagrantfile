# -*- mode: ruby -*-
# vi: set ft=ruby :



unless Vagrant.has_plugin?('vagrant-triggers')
  `vagrant plugin install vagrant-triggers`
end



# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  
  config.vm.box = "centos/7"
  config.vm.hostname = "dev1-node"
  config.vm.network "public_network"
  

  #enable hyper-v extensions
  config.vm.provider "hyperv" do |h|
      h.enable_virtualization_extensions = true
        # add cifs util so windows directories can be mounted on the centos  VM
      config.vm.provision :shell, inline: 'yum install -y cifs-utils'
      h.differencing_disk = true

  
  end





  config.vm.provision "shell", inline: <<-SHELL
    # shell commands to run the first time the VM starts

    sudo yum -y update

    # install utils
    yum install -y git
    
    yum install -y java-1.8.0-openjdk-devel
    
    yum install -y maven
    yum install -y ant

    #add support for extended disk mount - MLS
    # error was mount: wrong fs type, bad option, bad superblock on ....
    yum install -y nfs-utils
    yum install -y cifs-utils

  SHELL


  #run external shell provision files
  config.vm.provision "shell", path: "vagrant/install_docker.sh"
  config.vm.provision "shell", path: "vagrant/install_gradle.sh"



  #setup shared directory on windows using smb 
  config.vm.synced_folder ".", "/vagrant", type: "smb", mount_options: ['vers=3.0']

end