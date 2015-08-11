#!/usr/bin/env bash

# (Ansible Playbook) Ensure python output is printed as execution occurs.
# (Ansible Playbook) Specify what Ansible Playbook is running against.
export PYTHONUNBUFFERED=1

INVENTORY=$(mktemp -t XXXXX.hosts)
echo 127.0.0.1 > $INVENTORY

# Ensure Ansible is installed.
sudo yum install -y epel-release
sudo yum install -y ansible

# Run Ansible provisioner.
ansible-playbook /vagrant/server/provision/configure.yml --connection=local -i $INVENTORY -u vagrant

# Clean up
rm $INVENTORY