# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'vagrant-hosts'
require 'vagrant-auto_network'


# these are the internal IPs, alternate IPs are auto-assigned using vagrant-auto_network
scaleio_nodes = {
#  'tb' => { :ip => '192.168.50.11', :hostname => 'tb', :domain => 'scaleio.local', :memory => 1024, :cpus => 1 },
  'mdm1' => { :ip => '192.168.50.12', :hostname => 'mdm1', :domain => 'scaleio.local', :memory => 1024, :cpus => 1 },
  'node1' => { :ip => '192.168.50.12', :hostname => 'mdm1', :domain => 'scaleio.local', :memory => 1024, :cpus => 1 },
  'node2' => { :ip => '192.168.50.12', :hostname => 'mdm1', :domain => 'scaleio.local', :memory => 1024, :cpus => 1 },
#  'mdm2' => { :ip => '192.168.50.13', :hostname => 'mdm2', :domain => 'scaleio.local', :memory => 1024, :cpus => 1 },
}

Vagrant.configure(2) do |config|

  scaleio_nodes.each do | node_name, value | 
    config.vm.define node_name do | node | 
      node.vm.box = "centos/7"
      node.vm.hostname = "#{value[:hostname]}.#{value[:domain]}"
      node. vm.provider "virtualbox" do |vb|
        vb.memory = value[:memory] || 1024
        vb.cpus = value[:cpus] || 1
      end
      node.vm.network :private_network, :ip => value[:ip]
      node.vm.network :private_network, :auto_network => true 
      node.vm.provision "shell", path: "bootstrap.sh"
    end
  end
end
