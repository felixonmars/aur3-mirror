#!/bin/sh

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
cat << EOF
    ===> To enable the bluetooth service, run '# systemctl enable bluetooth.service'
    ===> To enable the obex service, one needs to add 'systemd --user &' to their '.xinitrc' and enable the service with '$ systemctl --user start obex.service'
EOF
}

# vim:set ts=2 sw=2 ft=sh et: