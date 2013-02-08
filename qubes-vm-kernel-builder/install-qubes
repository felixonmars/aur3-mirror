#!/bin/bash

build() {
    local mod

    add_module xen-blkfront
    add_module dm-snapshot
    add_binary "dmsetup"
    add_binary "ls"
    add_binary "sleep"

    add_file "/usr/lib/udev/rules.d/10-dm.rules"
    add_file "/usr/lib/udev/rules.d/13-dm-disk.rules"
    add_file "/usr/lib/udev/rules.d/95-dm-notify.rules"
    add_file "/usr/lib/initcpio/udev/11-dm-initramfs.rules" "/usr/lib/udev/rules.d/11-dm-initramfs.rules"

    add_runscript
}

help() {
    cat <<HELPEOF
This hook allows for an initializing qubes mapper devices.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
