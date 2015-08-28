#!/usr/bin/env bash

# (Ansible Playbook) Ensure python output is printed as execution occurs.
# (Ansible Playbook) Specify what Ansible Playbook is running against.
export PYTHONUNBUFFERED=1

INVENTORY=$(mktemp -t XXXXX.hosts)
echo 127.0.0.1 > $INVENTORY

# Sync package repositories
sudo apt-get update

# Ensure software-properties-common is installed (so we can add the Ansible PPA)
sudo apt-get install -y software-properties-common

# Add the Ansible PPA if it is not already present
if ! grep -q "ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt-get update
fi

# Ensure Ansible is installed.
sudo apt-get install -y ansible

# Run Ansible provisioner.
ansible-playbook /vagrant/server/provision/configure.yml --connection=local -i $INVENTORY -u vagrant

# Clean up
rm $INVENTORY