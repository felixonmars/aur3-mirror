#!/bin/bash

# Some colored makepkg-like functions
msg() {
    printf "${green}==>${bold} $1${all_off}\n"
}

msg_yellow() {
    printf "${yellow}==>${bold} $1${all_off}\n"
}

msg2() {
    printf "${blue}  ->${bold} $1${all_off}\n"
}

msg2_yellow() {
    printf "${yellow}  ->${bold} $1${all_off}\n"
}

read_msg2() {
    read -p "${blue}  ->${bold} $1${all_off}"
}

msg3() {
    printf "${yellow}    ->${bold} $1${all_off}\n"
}

error() {
    printf "${red}==> error:${bold} $1${all_off}\n"
}

error2() {
    printf "${red}    *${bold} $1${all_off}\n"
}

# Colors
all_off="$(tput sgr0)"
bold="${all_off}$(tput bold)"
blue="${bold}$(tput setaf 4)"
green="${bold}$(tput setaf 2)"
red="${bold}$(tput setaf 1)"
yellow="${bold}$(tput setaf 3)"

# Version information
print_version() {
    echo "$(basename $0) $(pacman -Q vmware-patch | cut -d ' ' -f2)"
    echo "Copyright (c) 2013-2014  Nobody"
    echo
    echo "THIS SCRIPT IS PROVIDED AS-IS FOR ANY PURPOSE WHATSOEVER. YOU ARE FREE TO SHARE IT, MODIFY IT,"
    echo "TAKE CREDIT OF IT, AND SELL IT ON THE STREETS."
    echo
    echo "FIGHT THE POWER."
}

# Make sure we are root
root_check() {
    if (( $EUID != 0 )); then
        error "This script needs to be run as root."
        exit 1
    fi
}

# Is a VMware product installed?
vmware_check() {
    if [[ ! -f /usr/bin/vmware-installer ]]; then
        error "No VMware product found. Exiting.."
        exit 1
    fi
}

# Product name
set_product_name() {
    ver=$(vmware-installer -l |& grep -Po "(player|workstation) *\K(\d+\.){2}\d+")
    if vmware-installer -l |& grep -q "workstation"; then
        name="VMware Workstation"
    else
        name="VMware Player (Plus)"
    fi
}

# Compile leftover module locations
remove_leftover_module_dirs() {
    for i in /usr/lib/modules/*; do
        if [[ $(ls "$i") = misc ]]; then
            misc+=("$i")
        fi
    done

    # Remove them
    if [[ $misc ]]; then
        msg_yellow "Removing leftover module location.."
        for i in ${misc[@]}; do
            msg2 "$i/"
            rm -r "$i"
        done
    fi
}

# Remove old backups
# ls: supports multiple arguments as opppsed to [ -d ]
remove_old_backups() {
    if ls -d source-*.*/ 2>/dev/null | grep -qv "$ver/"; then
        msg_yellow "Cleaning up old backups.."
        # Print full paths
        for i in $(readlink -f source-*.*/ | grep -v "$ver"); do
            msg2 "$i/"
            rm -r "$i"
        done
    fi
}
