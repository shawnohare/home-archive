#! /usr/bin/env bash

git clone https://github.com/shawnohare/home.git $HOME/.
git clone --bare https://github.com/shawnohare/home.git $HOME/.git
cd $HOME/.git
git config --local status.showUntrackedFiles no

# To checkout files and overwrite any existing ones not part of the repo
cd ~
git --git-dir=$HOME/.git/ --work-tree=$HOME checkout -f

source $HOME/.profile





