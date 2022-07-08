# Introduction

User configuration managed through a bare git repo.

To initialize
```bash
alias home='/usr/local/bin/git --git-dir=$HOME/home.git/ --work-tree=$HOME'
git init --bare $HOME/home.git
home config --local status.showUntrackedFiles no
home remote add origin https://github.com/shawnohare/home.git
```
