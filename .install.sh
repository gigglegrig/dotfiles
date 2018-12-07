#!/bin/bash

yum -y install git
# clone git repo and submodules
git init
git remote add origin git@github.ibm.com:Xi-Sun/dotfiles.git
git fetch
git checkout -t origin/master -f
git submodule update --init --recursive

# install vim 8
yum install -y ncurses-devel unzip
wget https://github.com/vim/vim/archive/master.zip
cd vim-master/src/
./configure --with-features=huge -enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config
sudo make
sudo make install
export PATH=/usr/local/bin:$PATH
cd ~

# make YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
python ./install.py --all
cd ~
