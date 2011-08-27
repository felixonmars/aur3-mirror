#!/bin/bash

post_install() {
    grep "/opt/nessus/lib" /etc/ld.so.conf &>/dev/null || echo "/opt/nessus/lib" >> /etc/ld.so.conf
    ldconfig
    /bin/true
}

post_upgrade() {
    /bin/true
}

pre_remove() {
    /bin/true
}

op=$1
shift

$op "$@"
