#!/usr/bin/env /bin/bash

brew install minikube
rm ~/.docker ~/.minikube
mkdir ~/goinfre/.minikube
mkdir ~/goinfre/.docker
ln -s ~/goinfre/.minikube ~/.minikube
ln -s ~/goinfre/.docker ~/.docker
./clearcache.sh
rm ~/Library/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.leases
. ../setup.sh