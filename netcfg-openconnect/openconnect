#!/bin/bash

. /usr/lib/network/network

openconnect_up() {
    local CMD_FLAGS PID_FILE AUTH_GROUP PASSWORD URL USER VPNC_SCRIPT

    load_profile "$1"

    if [[ -z $URL ]]; then
       report_fail "No url specified in profile"
       exit 1
    fi

    VPNC_SCRIPT=${VPNC_SCRIPT:-/etc/vpnc/vpnc-script}
    if [[ ! -e $VPNC_SCRIPT ]]; then
       report_fail "vpnc script does not exists: $VPNC_SCRIPT"
       exit 1
    fi

    PASSWORD=${PASSWORD:-""}
    [[ -n $USER ]] && CMD_FLAGS+=" --user=$USER"
    [[ -n $PASSWORD ]] && CMD_FLAGS+=" --passwd-on-stdin"
    [[ -n $AUTH_GROUP ]] && CMD_FLAGS+=" --authgroup=$AUTH_GROUP"

    PID_FILE="/run/openconnect-$1.pid"

    /usr/sbin/openconnect --background --quiet --script "$VPNC_SCRIPT" $CMD_FLAGS "$URL" <<<"$PASSWORD"

    if [[ $? -ne 0 ]]; then
       report_fail "openconnect connection failed"
       exit 1
    fi

    /usr/bin/pgrep -n ^openconnect$ > "$PID_FILE"
}

openconnect_down() {
    local CMD_FLAGS PID_FILE AUTH_GROUP PASSWORD URL USER VPNC_SCRIPT

    load_profile "$1"
    PID_FILE="/run/openconnect-$1.pid"

    kill -- $(<$PID_FILE)
    rm -- "$PID_FILE"
}

openconnect_$1 "$2"
exit $?

# vim: ft=sh ts=4 et sw=4:
