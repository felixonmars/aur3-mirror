#!/bin/sh

PORTDIR="/usr/portage"
SYNC="rsync://mirror.averse.net/gentoo-portage"

. /etc/make.conf

error() {
        local mesg=$1; shift
        if [ -t 2 -a ! "$USE_COLOR" = "n" ]; then
                printf "\033[1;31m==> ERROR:\033[1;0m\033[1;1m ${mesg}\033[1;0m\n" "$@" >&2
        else
                printf "==> ERROR: ${mesg}\n" "$@" >&2
        fi
}

check_root() {
        if [ -z "$EUID" -a -x /usr/bin/id ]; then
                EUID=`id -u`
                UID=`id -ru`
        fi
        if [ "$EUID" != "0" ]; then
                error "must run as root."
                exit 1
        fi

}

do_sync() {
	rsync --recursive --links --safe-links --perms --times --compress --force --whole-file --delete --stats --timeout=180 --exclude=/distfiles --exclude=/local --exclude=/packages --verbose $SYNC $PORTDIR
}

check_root
do_sync
