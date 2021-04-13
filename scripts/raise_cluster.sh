#!/usr/bin/env /bin/bash

brew install minikube
rm -rf  ~/.docker ~/.minikube ~/goinfre/.minikube ~/goinfre/.docker
mkdir ~/goinfre/.minikube
mkdir ~/goinfre/.docker
ln -s ~/goinfre/.minikube ~/.minikube
ln -s ~/goinfre/.docker ~/.docker
./scripts/clearcache.sh
