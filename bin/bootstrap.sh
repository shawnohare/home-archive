#! /usr/bin/env sh

if [[ ! -d "$HOME/home.git" ]]; then
    git clone https://github.com/shawnohare/home.git $HOME/home.git
fi

if [[ ! -d "$HOME/.git" ]]; then
    echo "Cloning bare repo and checking out files."
    git clone --bare https://github.com/shawnohare/home.git "$HOME/.git"
    git --git-dir="$HOME/.git" config --local status.showUntrackedFiles no
    git --git-dir="$HOME/.git/" --work-tree="$HOME" checkout -f
fi

# To checkout files and overwrite any existing ones not part of the repo

source $HOME/.profile
set_vars
set_path

# Install nix package manager and nix-darwin via flake.
sh <(curl -L 'https://nixos.org/nix/install') --daemon
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
case "${OSTYPE}" in
    linux*)
        ;;
    darwin*)
        sudo mdutil -i off /nix
        sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
        cd ~/tmp
        nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
        ./result/bin/darwin-installer
        # FIXME: Below is buggy since nix 2.9
        # nix build .#darwinConfigurations.x86_64.system
        # ./result/sw/bin/darwin-rebuild switch --flake .

        ;;
esac
