#! /usr/bin/env bash

function _git() {
    git --git-dir=$HOME/.git/ --work-tree=$HOME "$@"
}


function sync() {
    # Pull changes into bare repo and checkout
    cd ~/home.git
    git add .
    git commit -m "Syncing"
    git push
    _git fetch
    _get pull -f
}

function edit() {
    # Obviated by the nvim wrapper in ~/bin/vi
    export GIT_DIR="$HOME/.git"
    export GIT_WORK_TREE="$HOME"
    nvim "$@"
}

# Parse command aliases.
cmd=$1
case $cmd in
e)
    cmd=edit
    ;;
s)
    cmd=status
    ;;
esac

case $cmd in
edit)
    edit "${@:2}"
    ;;
git)
    _git "${@:2}"
    ;;
add|commit|diff|log|pull|push|restore|stash|status|switch|unstage)
    _git "${cmd}" "${@:2}"
    ;;
*)
    echo "Command $1 not recognized."
    exit
    ;;
esac
