#!/bin/sh

Catalyst=$(lspci | grep -ic vga)
LibState=$(/usr/lib/fglrx/switchlibglx query)
XorgState=$(readlink /etc/X11/xorg.conf)

function switch_to_amd() {
    if [ "$XorgState" != "/etc/X11/xorg.conf.cat" ]; then
        ln -snf /etc/X11/xorg.conf.cat /etc/X11/xorg.conf
    fi

    if [ "$LibState" = "intel" ]; then
        /usr/lib/fglrx/switchlibGL amd
        /usr/lib/fglrx/switchlibglx amd
    fi

    modprobe fglrx
}

function switch_to_intel() {
    if [ "$XorgState" != "/etc/X11/xorg.conf.oth" ]; then
        ln -snf /etc/X11/xorg.conf.oth /etc/X11/xorg.conf
    fi

    if [ "$LibState" = "amd" ]; then
        /usr/lib/fglrx/switchlibGL intel
        /usr/lib/fglrx/switchlibglx intel
    fi

    modprobe radeon
}


if [[ $Catalyst -eq 1 ]]; then
    echo "fglrx"
    switch_to_amd
else
    echo "i915/radeon"
    switch_to_intel
fi
