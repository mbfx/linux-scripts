#!/usr/bin/bash

echo "Installing EPEL repository..."
yum -y -q install epel-release

echo "Installing wget/vim/git/python3/ansible..."
yum -y -q install wget vim git python3 ansible yum-utils

echo "Installing repositories..."
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum-config-manager --add-repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

echo "Installing VirtualBox 6.1 and prerequisites..."
yum -y -q install dkms kernel-devel
yum -y -q groupinstall "Development Tools"
yum -y -q install VirtualBox-6.1
usermod -a -G vboxusers mbfx

echo "Installing Hashicorp software..."
yum -y -q install vagrant terraform

