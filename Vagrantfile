# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  slaves = []

  File.open("hosts", "r").each_line do |line|
    ip, _, host = line.split

    if host != "master" then
      slaves << host
    end

    config.vm.define host do |machine|
      machine.vm.provider :libvirt do |libvirt|
        libvirt.storage_pool_name = "images"
        libvirt.cpus = 1
        libvirt.memory = 1024
        libvirt.graphics_type = "none"
      end
      machine.vm.network :private_network, :ip => ip
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.groups = {
      "master" => ["master"],
      "slave" => slaves
    }
  end

  config.ssh.insert_key = false
end
