# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

require 'yaml'

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  yaml = YAML.load_file("group_vars/all.yml")
  hosts = yaml["hosts"]

  hosts.each do |host|
    config.vm.define host["name"] do |machine|
      machine.vm.provider :libvirt do |libvirt|
        libvirt.storage_pool_name = "images"
        libvirt.cpus = 1
        libvirt.memory = 1024
        libvirt.graphics_type = "none"
      end
      machine.vm.network :private_network, :ip => host["ip"]
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.groups = {
      "master" => hosts.select { |h| h["master"] } .map { |h| h["name"] },
      "slave" => hosts.select { |h| !h["master"] } .map { |h| h["name"] }
    }
  end

  config.ssh.insert_key = false
end
