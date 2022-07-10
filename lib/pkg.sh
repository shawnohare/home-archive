# lib of applications to install

function pkg::mamba::install() {
    # Some notes from the 4.12.0-0 installer script.
    # Installs Mambaforge 4.12.0-0

    # -b           run install in batch mode (without manual intervention),
    #              it is expected the license terms (if any) are agreed upon
    # -f           no error if install prefix already exists
    # -h           print this help message and exit
    # -p PREFIX    install prefix, defaults to $PREFIX, must not contain spaces.
    # -s           skip running pre/post-link/install scripts
    # -u           update an existing installation
    # -t           run package tests after installation (may install conda-build)
    if [ -e "${MAMBA_ROOT_PREFIX}/bin/mamba" ]; then
        return 0
    fi

    installer="Mambaforge-$(uname)-$(uname -m).sh"
    if [ ! -e "${installer}" ]; then
        wget "https://github.com/conda-forge/miniforge/releases/latest/download/${installer}"
    fi
    bash "${installer}" -bs -p ${MAMBA_ROOT_PREFIX}
}

function pkg::mamba::remove() {

}

function pkg::mamba::update() {
    echo "Not implemented"
    exit 1
}

function pkg::nix::install() {
    if [ -d /nix ]; then
        echo "Nix already installed."
        return 0
    fi
    local cmd="sh <(curl -L 'https://nixos.org/nix/install') --daemon"
    case "${OSTYPE}" in
        linux*)
            "${cmd}"
            ;;
        darwin*)
            "${cmd}" --darwin-use-unencrypted-nix-store-volume
            sudo mdutil -i off /nix
            ;;
    esac
}

function pkg::nix::remove() {
    set -e pipefail

    echo "  Manual steps. "
    echo "  1. Remove the entry from fstab using 'sudo vifs'"
    echo "  2. Destroy the data volume using 'diskutil apfs deleteVolume'"
    echo "  3. Remove the 'nix' line from /etc/synthetic.conf or the file"

    if [ -f /Library/LaunchDaemons/org.nixos.nix-daemon.plist ]; then
        sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
        sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
    fi

    # Restore profiles / rc files
    for conf in profile bashrc zshrc; do
        if [ -f "/etc/${conf}.backup-before-nix" ]; then
          sudo mv "/etc/${conf}.backup-before-nix" "/etc/${conf}"
        fi
    done

    # Remove nix build user
    # for i in $(seq 1 $(sysctl -n hw.ncpu)); do
    for i in {1..32}; do
        if id -u "nixbld$i" ; then
            sudo /usr/bin/dscl . -delete "/Users/nixbld$i"
        fi
    done

    if id -g nixbld; then
        sudo /usr/bin/dscl . -delete "/Groups/nixbld"
    fi

    # Delete the files Nix added to your system:
    rm -rf $HOME/{.nix-channels,.nix-defexpr,.nix-profile,.config/nixpkgs}

    # rm -rf ${XDG_CONFIG_HOME}/nixpkgs
    sudo rm -rf /etc/nix /nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels

    # Manual steps
    # Note: a multi-user installation is possible. See https://nixos.org/nix/manual/#sect-multi-user-installation
    # Creating volume and mountpoint /nix.

    #      ------------------------------------------------------------------
    #     | This installer will create a volume for the nix store and        |
    #     | configure it to mount at /nix.  Follow these steps to uninstall. |
    #      ------------------------------------------------------------------

    #   1. Remove the entry from fstab using 'sudo vifs'
    #   2. Destroy the data volume using 'diskutil apfs deleteVolume'
    #   3. Remove the 'nix' line from /etc/synthetic.conf or the file
}
