# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604-desktop"

  config.vm.synced_folder ".", "/home/vagrant/dotfiles"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    bash -c ~/dotfiles/bootstrap.sh
    bash -c ~/dotfiles/init/ubuntu.sh
  SHELL
end
