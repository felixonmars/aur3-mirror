#!/bin/bash

INTERFACE=$1
STATUS=$2
DISPATCH_DAEMON="ufw"

global_offline_stop() {
    # Check the global state and stop daemon if no connection is active.
    if [ ! `nm-tool|grep State|head -n1|cut -d':' -f2|sed s'/ //g'` == "connected(global)" ]; then
        /etc/rc.d/${DISPATCH_DAEMON} stop
    fi
}

if [ -e "/etc/rc.d/${DISPATCH_DAEMON}" ]; then
    case "${STATUS}" in
        up)
            /etc/rc.d/${DISPATCH_DAEMON} start
        ;;
        vpn-up)
            /etc/rc.d/${DISPATCH_DAEMON} start
        ;;
        down)
            global_offline_stop
        ;;
        vpn-down)
            global_offline_stop
        ;;
    esac
fi
