# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.define "master", primary: true do |master|
    master.vm.provider :libvirt do |libvirt|
      libvirt.storage_pool_name = "images"
      libvirt.cpus = 1
      libvirt.memory = 1024
    end
    master.vm.network :private_network, :ip => "10.0.10.2"
  end

  (1..4).each do |i|
    config.vm.define "slave#{i}" do |slave|
      slave.vm.provider :libvirt do |libvirt|
        libvirt.storage_pool_name = "images"
        libvirt.cpus = 1
        libvirt.memory = 1024
      end
      slave.vm.network :private_network, :ip => "10.0.10.#{i+2}"
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook/site.yml"
    ansible.groups = {
      "master" => ["master"],
      "slave" => ["slave[1:4]"]
    }
  end
end
