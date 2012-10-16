#!/bin/bash

build() {
    add_module "tpm_tis"

    add_dir "/antievilmaid"
    add_file "/usr/lib/initcpio/udev/69-anti-evil-maid.rules" \
        "/usr/lib/udev/rules.d/69-anti-evil-maid.rules"

    # TPM software stack
    add_binary "/usr/bin/tpm_unsealdata" "/usr/bin/tpm_unsealdata"
    add_binary "/usr/sbin/tpm_version" "/usr/bin/tpm_version"
    add_binary "/usr/sbin/tcsd" "/usr/bin/tcsd"

    # tcsd dependencies
    add_dir "/var/lib/tpm"
    add_file "/usr/lib/initcpio/antievilmaid/hosts" "/etc/hosts"
    add_file "/usr/lib/initcpio/antievilmaid/passwd" "/etc/passwd"
    add_file "/usr/lib/initcpio/antievilmaid/shadow" "/etc/shadow"
    add_file "/usr/lib/libnss_files.so.2"
    add_file "/etc/nsswitch.conf"

    add_runscript
}

help() {
    cat <<<HELPEOF
This hook allows for Anti Evil Maid support for devices with a TPM. It is
essentially a port of the Dracut module by Invisible Things Lab to mkinitcpio.
HELPEOF
}
