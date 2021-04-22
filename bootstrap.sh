#!/bin/bash

# Update the system
# echo "Updating system"

yum update -y 

# Install some packages
echo "Installing important packages"
yum install -y git redhat-lsb-core net-tools bind-utils wget bash-completion bash-completion-extras vim unzip xorg-x11-xauth xorg-x11-fonts-* xorg-x11-font-utils xorg-x11-fonts-Type1 wget

# Enable password authentication for fast recap
echo "Enabling password authentication in sshd config"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Disable SELinux
echo "Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Set Root password for fast recap
echo "Set root password"
echo "panda" | passwd --stdin root

# start  firewalld
echo "start firewalld"
systemctl stop firewalld

# Update all packages that have available updates.
yum update -y

# Install Python 3 and pip.
yum install -y python3-pip

# Upgrade pip3.
pip3 install --upgrade pip

# Install Ansible.
pip3 install ansible[azure]

# Install Ansible modules and plugins for interacting with Azure.
ansible-galaxy collection install azure.azcollection

# Install required modules for Ansible on Azure
wget https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt

# Install Ansible modules
pip3 install -r requirements-azure.txt

# Install Azure Cli

rpm --import https://packages.microsoft.com/keys/microsoft.asc

sh -c 'echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'


yum install azure-cli -y

