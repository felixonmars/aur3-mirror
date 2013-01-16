#!/bin/bash

build() {
    # virtio
        if add_checked_modules 'virtio'; then
            blockdevs['virtio_blk?']=1
        fi
    map add_module "${!blockdevs[@]}"
}

help() {
    cat <<HELPEOF
This hook loads the necessary modules for most block devices using virtual devices. Detection will take place at runtime. To minimize
the modules in the image, add the autodetect hook too.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
