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
. "${HOME}/.config/sh/env.sh"
