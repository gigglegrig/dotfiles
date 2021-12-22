#!/bin/bash

chsh -s /bin/bash
# Assume you are on centos or redhat
sudo yum -y install git
# clone git repo and submodules
git init
git remote add origin https://github.com/gigglegrig/dotfiles.git
git reset --hard origin/master
git pull
git submodule update --init --recursive

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# base16
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell



source ~/.bashrc
vim +PluginInstall +qall

