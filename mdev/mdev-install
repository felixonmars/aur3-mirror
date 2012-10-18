#!/bin/bash
local applet

    add_binary busybox

    for applet in $(/bin/busybox --list); do
        add_symlink "/usr/bin/$applet" busybox
        add_symlink "/sbin/mdev" busybox
    done

    # add kmod with applet symlinks
    add_binary kmod
    for applet in {dep,ins,rm,ls}mod mod{probe,info}; do
        add_symlink "/usr/bin/$applet" kmod
    done

    add_binary blkid
    add_binary mount
    add_binary switch_root

    add_symlink "/etc/mtab" "/proc/self/mounts"

    # Add an empty fstab for mount and fsck
    >"$BUILDROOT/etc/fstab"

    add_file "/usr/lib/initcpio/init_functions" "/init_functions"
    add_file "/usr/lib/initcpio/init" "/init"
    add_file "/usr/lib/modprobe.d/usb-load-ehci-first.conf"

    add_runscript
}

help() {
    cat <<HELPEOF
This hook replaces Arch Linux default "base" hook to enable mdev usage. 
You know what you are doing, aren't you?
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:

