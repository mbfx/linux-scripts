#!/usr/bin/bash

echo "Installing EPEL repository..."
yes | yum -y -q install epel-release

echo "Installing wget/vim/git/python3/ansible..."
yes | yum -y -q install wget vim
yes | yum -y -q install git
yes | yum -y -q install python3
yes | yum -y -q install ansible

echo "Installing VirtualBox repo..."
if [[ ! -e /etc/yum.repos.d/virtualbox.repo ]]
    then
        wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo --directory-prefix=/etc/yum.repos.d/ --quiet
    else
        "File /etc/yum.repos.d/virtualbox.repo exist!"
fi 

echo "Installing VirtualBox 6.1 and prerequisites..."
yes | yum -y -q install dkms kernel-devel
yes | yum -y -q install groupinstall "Development Tools"
yes | yum -y -q install VirtualBox-6.1
usermod -a -G vboxusers mbfx

echo "Installing Vagrant 2.2.7..."
yes | yum -y -q install https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm

exit 0
