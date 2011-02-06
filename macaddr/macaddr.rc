#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/conf.d/macaddr

case "$1" in
  start)
    STARTNET=
    if ! ck_daemon network; then
	    /etc/rc.d/network stop
	    sleep 1
	    STARTNET=true
    fi
    stat_busy "Start MAC address"
    for DEVICE in ${interfaces_mac}; do
	eval DEVICEMAC=\$\{${DEVICE}_mac\}
        /sbin/ifconfig ${DEVICE} down hw ether ${DEVICEMAC}
    done
    stat_done
    add_daemon macaddr
    [ "${STARTNET}" == "true" ] && /etc/rc.d/network start
    ;;
  stop)
    stat_busy "Stop MAC address"
    stat_done
    rm_daemon macaddr
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

