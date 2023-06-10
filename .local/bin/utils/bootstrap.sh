#! /usr/bin/env bash
# WARNING: Largely deprecated by a few manual commands and nix-darwin.

# if [[ ! -d "$HOME/home.git" ]]; then
#     git clone https://github.com/shawnohare/home.git $HOME/home.git
# fi

function clone() {
    if [[ ! -d "$HOME/.git" ]]; then
        printf "Cloning bare repo and checking out files.\n"
        git clone --bare https://github.com/shawnohare/home.git "$HOME/.git"
        git --git-dir="$HOME/.git" config --local status.showUntrackedFiles no
        git --git-dir="$HOME/.git" --work-tree="$HOME" checkout -f
    else
        printf "$HOME/.git already exists, skipping clone.\n"
    fi

    if [[ ! -d "$HOME/nixos-config" ]]; then
        printf "Cloning bare repo and checking out files.\n"
        git clone https://github.com/shawnohare/nixos-config.git "$HOME/nixos-config"
    else
        printf "$HOME/nixos-config already exists, skipping clone.\n"
    fi

}

function init() {
    case "${OSTYPE}" in
        linux*)
            ;;
        darwin*)
            xcode-select --install 2&> /dev/null
            ;;
    esac
    clone
    source $HOME/.profile
    set_vars
    set_path
}



function install_nix() {
    if [[ ! -d "/nix" ]]; then
        # Install nix package manager and nix-darwin via flake.
        printf "Installing nix package manager.\n"
        sh <(curl -L 'https://nixos.org/nix/install') --daemon
        source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        case "${OSTYPE}" in
            linux*)
                ;;
            darwin*)
                sudo mdutil -i off /nix
                # sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
                # cd ~/tmp
                # nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
                # ./result/bin/darwin-installer
                ;;
        esac

    else
        printf "/nix already exists. Skipping nix install.\n"
    fi

}

# To checkout files and overwrite any existing ones not part of the repo
function main() {
    init
    install_nix
}

main
