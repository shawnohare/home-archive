## Introduction

User configuration managed through a bare git repo.

## Usage
```bash
alias hgit='/usr/bin/env git --git-dir=$HOME/.git/ --work-tree=$HOME'
git clone --bare https://github.com/shawnohare/home.git $HOME/.git
cd $HOME/.git
git config --local status.showUntrackedFiles no

# To checkout files and overwrite any existing ones not part of the repo
git --git-dir=$HOME/.git/ --work-tree=$HOME checkout -f
```

Pulling files onto a machine without destroying
```
git clone https://github.com/shawnohare/home.git config.tmp
rsync --recursive --verbose --exclude '.git' config.tmp/ $HOME/
rm -rf config.tmp
```
