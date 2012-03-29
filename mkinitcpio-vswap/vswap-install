#!/bin/bash

build() {
    MODULES="phram mtdblock"
    BINARIES="/sbin/mkswap"
    add_file /etc/modprobe.d/vswap.conf /etc/modprobe.d/vswap.conf
    SCRIPT="vswap"
}

help() {
    cat <<HELPEOF
This hook creates swap in VRAM
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
