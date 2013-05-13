#!/bin/bash
. /etc/pacmannrd.conf

PATH="$PACMAN_NRD_PATH:$PATH" $PACMAN_BIN "$@"

# TODO: runn all scripts in dir with --transaction-finished param
$PACMAN_NRD_PATH/gtk-update-icon-cache --transaction-finished
