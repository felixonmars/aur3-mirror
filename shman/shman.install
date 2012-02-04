#!/bin/bash

_msg() {
    cat <<EOF
Before using shman, you should run 'freshman' as root to $1 the
manpage database.
EOF
}


post_install() {
    _msg create
}

post_upgrade() {
    _msg recreate
}
