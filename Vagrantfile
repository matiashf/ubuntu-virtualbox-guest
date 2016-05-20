# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "ubuntu-virtualbox-guest" do |config|
    config.vm.box = "ubuntu/xenial64"

    config.vm.provider :virtualbox do |vb|
      vb.name = "ubuntu-virtualbox-guest"
    end

    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provision "shell", inline: "apt-get update && apt-get install -qq virtualbox-guest-utils --no-install-recommends"
  end
end
