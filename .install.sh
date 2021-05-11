#!/bin/bash

# Assume you are on centos or redhat
sudo yum -y install git
# clone git repo and submodules
git init
git remote add origin https://github.com/gigglegrig/dotfiles.git
git fetch
git checkout -t origin/master -f
git submodule update --init --recursive

# install vim 8
sudo yum install -y ncurses-devel unzip
wget https://github.com/vim/vim/archive/master.zip
unzip ./master.zip
cd vim-master/src/
./configure --with-features=huge -enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config
sudo make
sudo make install
export PATH=/usr/local/bin:$PATH
cd ~


source ~/.bashrc
vim +PluginInstall +qall
