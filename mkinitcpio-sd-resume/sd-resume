#!/bin/bash

build(){
    add_systemd_unit systemd-resume-setup.service
    add_file /usr/lib/systemd/scripts/resume-setup
    #Workaround
    add_symlink /usr/lib/systemd/system/sysinit.target.wants/systemd-resume-setup.service /usr/lib/systemd/system/systemd-resume-setup.service
}

help() {
    cat <<HELPEOF
This hook initializes support for resuming from Disk. Supports systemd
with swsusp.
HELPEOF
}
