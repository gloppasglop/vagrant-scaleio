#!/bin/bash


cd sync

yum -y update

sudo yum -y install git

# Install Puppet collection repository
sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

sudo yum -y install puppet-agent

export PATH=$PATH:/opt/puppetlabs/bin

puppet resource user puppet ensure=present

/opt/puppetlabs/puppet/bin/gem install r10k

puppet module install --modulepath=/root/bootstrap/modules zack/r10k --version 3.2.0
puppet module install --modulepath=/root/bootstrap/modules hunner/hiera --version 1.4.1

puppet apply --modulepath=/root/bootstrap/modules  r10k.pp
puppet apply --modulepath=/root/bootstrap/modules  hiera.pp
