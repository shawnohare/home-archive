# ----------------------------------------------------------------------------
# ~/.profile is executed by the command interpreter for login shells.
# Historically, processing heavy setup is performed here, while transient
# settings that are not inherited are put in rc files so they can be re-read by
# every new interactive shell invocation.
#
# NOTE: functions and aliases do not persist, so the file must re-sourced.
# We opt to put them in separate files and treat ~/.profile as containing
# bootstrap env vars for POSIX shells.
# ----------------------------------------------------------------------------
if [ -n "${SH_PROFILE_SOURCED+x}" ];then
    return 0
fi

export TMPDIR="${TMPDIR:-/tmp}"

# ----------------------------------------------------------------------------
# XDG Base Directory Specification
# Most applications that utlize XDG respect these variables, but some
# still utilize hard-coded values or do not have access to the user env
# (e.g., some graphical applications).
# ----------------------------------------------------------------------------
export LOCAL_HOME="${HOME}/.local"
export BIN_HOME="${HOME}/bin"
export OPT_HOME="${HOME}/opt"
export SRC_HOME="${HOME}/src"

export XDG_BIN_HOME="${LOCAL_HOME}/bin"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${LOCAL_HOME}/share"
export XDG_STATE_HOME="${LOCAL_HOME}/state"
export XDG_RUNTIME_DIR="${TMPDIR}"

# Misc vars forcing apps to adhere to the XDG Base Directory Specification.
# NOTE: Some apps, like ansible, appear to not respect AWS vars.
# export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
# export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
# export CARGO_INSTALL_ROOT="${XDG_BIN_HOME}"
# export GOBIN="${XDG_BIN_HOME}"
# export SPARK_HOME="/opt/spark"
export CARGO_HOME="${XDG_STATE_HOME}/cargo"
export CLICOLOR=1
export DOOMDIR="${XDG_CONFIG_HOME}/doom"
export EDITOR="nvim"
export GOPATH="${XDG_STATE_HOME}/go"
export HOMEBREW_BOOTSNAP=1
export HOMEBREW_CELLAR=/opt/homebrew/Cellar
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_REPOSITORY=/opt/homebrew
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export LESS=-Mr
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
export LISTLINKS=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export MAMBARC="${XDG_CONFIG_HOME}/mamba/config.yaml"
export MAMBA_ROOT_PREFIX="${XDG_STATE_HOME}/conda"
export MANCOLOR=1
export MANPAGER="nvim --clean +Man!"
export NIXPKGS_CONFIG="${XDG_CONFIG_HOME}/nixpkgs/config.nix"
export PAGER="less"
export PIPX_HOME="${XDG_STATE_HOME}/pipx"
export POETRY_HOME="${XDG_STATE_HOME}/pypoetry"
export POETRY_VIRTUALENVS_PATH="${XDG_STATE_HOME}/pypoetry/envs"
export PYENV="${XDG_STATE_HOME}/pyenv/bin/pyenv"
export PYENV_ROOT="${XDG_STATE_HOME}/pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYSPARK_DRIVER_PYTHON="ipython"
export RUSTUP_HOME="${XDG_STATE_HOME}/rustup" # Might be superfluous.
export SCREENRC="${XDG_CONFIG_HOME}/screen/screenrc"
export SPACEMACSDIR="${XDG_CONFIG_HOME}/spacemacs"
export SQITCH_USER_CONFIG="${XDG_CONFIG_HOME}/sqitch/config"
export STACK_ROOT="${XDG_STATE_HOME}/stack"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
export STASH_TARGET="${HOME}"
export TMUX_PLUGIN_MANAGER_PATH="${XDG_STATE_HOME}/tmux/plugins/"
export VISUAL="nvim"
export WEECHAT_HOME="${XDG_CONFIG_HOME}/weechat"


# Unclear if we need to set these as man should automatically look in share
# export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man:$MANPATH
# export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info:$INFOPATH
export SH_PROFILE_SOURCED=1
