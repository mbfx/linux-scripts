#!/usr/bin/bash

echo "Installing wget and vim..."
yes | yum -y -q install wget vim

echo "Installing VirtualBox repo..."
if [[ ! -e /etc/yum.repos.d/virtualbox.repo ]]
    then
        wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo --derwctory-prefix=/etc/yum.repos.d/ --quiet
    else
        "File /etc/yum.repos.d/virtualbox.repo exist!"
fi 

echo "Installing EPEL repository..."
yes | yum -y -q install epel-release

echo "Installing VirtualBox 5.2 and prerequisites..."
yes | yum -y -q install dkms kernel-devel
yes | yum -y -q install groupinstall "Development Tools"
yes | yum -y -q install VirtualBox-5.2
usermod -a -G vboxusers mbfx

echo "Installing Vagrant 2.2.5..."
yes | yum -y -q install https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.rpm

echo "Installing Git..."
yes | yum -y -q install Git

exit 0
