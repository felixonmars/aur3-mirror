#!/bin/bash

post_install() {
cat<<INSTALLEOF
* add hook "dm-cache" to mkinitcpio.conf
* rebuild the initramfs ("mkinitcpio -p linux")
* read man lvmcache
INSTALLEOF
}

post_remove() {
cat<<REMOVEEOF
Remove "dm-cache" from "HOOKS" in "/etc/mkinitcpio.conf",
then rebuild the initramfs ("mkinitcpio -p linux").
REMOVEEOF
}

post_upgrade() {
post_install
}

