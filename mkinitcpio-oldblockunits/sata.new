#!/bin/bash

build() {
    local filter
    local -A blockdevs

    #pata, sata, scsi
    for filter in 'scsi/.*ata' '/(block|scsi|fusion)/' 'ata/[ps]ata_' \
            'ata/(ahci|pdc_adma|ata_piix|ata_generic)'; do
        add_checked_modules "$filter" && blockdevs['sd_mod']=1
    done

help() {
    cat <<HELPEOF
This hook loads the necessary modules for most block devices using pata, sata,
and scsi. Detection will take place at runtime. To minimize
the modules in the image, add the autodetect hook too.
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
