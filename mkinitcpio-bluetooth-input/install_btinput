#!/bin/bash
#
# This file is part of mkinitcpio-bluetooth-input.  mkinitcpio-bluetooth-input 
# is free software: you can redistribute it and/or modify it under the terms 
# of the GNU General Public License as published by the Free Software Foundation, 
# version 2.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 51
# Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Copyright Aline Freitas <aline@alinefreitas.com.br>

build() {
    local mod
    for mod in bluetooth bnep hidp btusb rfcomm; do
	add_module "$mod"
    done

    add_binary /usr/bin/dbus-daemon /sbin/dbus-daemon
    add_binary /usr/sbin/bluetoothd /sbin/bluetoothd
    add_binary /usr/bin/hidd /sbin/hidd
    add_file /usr/lib/libnss_files.so.2 
    add_file /usr/lib/libnsl.so.1
    add_full_dir /etc/bluetooth
    add_file /etc/conf.d/bluetooth
    add_file /usr/lib/initcpio/dbus/system.conf /etc/dbus-1/system.conf
    add_file /usr/lib/initcpio/dbus/bluetooth.conf /etc/dbus-1/system.d/bluetooth.conf 
    add_file /usr/lib/initcpio/dbus/passwd /etc/passwd
    add_file /usr/lib/initcpio/dbus/group /etc/group

    add_full_dir /var/lib/bluetooth

    add_runscript
}

help() {
  cat <<HELPEOF
This hook installs the necessary daemons for bluetooth keyboard support in initcpio.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
