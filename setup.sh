#!/bin/sh

NAME=chromeos-yggdrasil-network-setup

# Clean up
trap "cd .. && rm -rf $NAME" EXIT
  
# Temporary bugfix as of `02/28/2020`
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78BD65473CB3BD13

# Install Ansible
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update && sudo apt install -y ansible

# Clone repository
git clone https://github.com/perguth/$NAME.git
cd $NAME

# Run playbook
ansible-playbook playbook.yml
