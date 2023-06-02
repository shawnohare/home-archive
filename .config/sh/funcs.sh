#!/usr/bin/env sh
# ----------------------------------------------------------------------------
# Various personal utility functions
# ----------------------------------------------------------------------------

nvim() {
    path="$(which nvim)"
    if [ "$(git rev-parse --is-inside-work-tree)" = "false" ]; then
        GIT_DIR="$HOME/.git" GIT_WORK_TREE="$HOME" "${path}" "$@"
    else
        "${path}" "$@"
    fi
}

git() {
    path="$(which git)"
    if [ "$(git rev-parse --is-inside-work-tree)" = "false" ]; then
        GIT_DIR="$HOME/.git" GIT_WORK_TREE="$HOME" git "$@"
    else
        git "$@"
    fi
}
