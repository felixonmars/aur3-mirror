#!/bin/bash

. /etc/rc.d/functions
. /etc/conf.d/cjdns

PID=`pidof -o %PPID /usr/bin/cjdroute`

function removetun {
    if [ ! $(ip tuntap list | grep -c `id -u "$CJDNS_USER"`) = 0 ]; then ip tuntap del mode tun $(ip tuntap list | grep -m1 `id -u "$CJDNS_USER"` | grep -o -E "^tun[^\:]*"); fi
}

case "$1" in
  start)
    stat_busy "Starting cjdroute"

    #FAIL IF THE CONFIG OR USER DO NOT EXIST
    if [ ! -f "$CJDNS_CONFIG" -o ! -s "$CJDNS_CONFIG" ]; then
      stat_busy "$CJDNS_CONFIG is missing/empty: run 'cjdroute --genconf > $CJDNS_CONFIG' then configure it"
      stat_fail
      exit 1
    elif [ $(grep -c "$CJDNS_USER" /etc/passwd) = 0 ]; then
      stat_busy "The user "$CJDNS_USER" does not exist"
      stat_fail
      exit 1
    fi

    #CREATE TUN DEVICE IF IT DOESN'T ALREADY EXIST AND SET $CJDNS_TUN TO THE DEVICE NAME
    if [ $(ip tuntap list | grep -c `id -u "$CJDNS_USER"`) = 0 ]; then ip tuntap add mode tun user "$CJDNS_USER"; fi
    CJDNS_TUN=$(ip tuntap list | grep -m1 `id -u "$CJDNS_USER"` | grep -o -E "^tun[^\:]*")

    #REMOVE THE TUN DEVICE IF THE SCRIPT IS KILLED
    trap removetun SIGINT

    #FAIL IF $CJDNS_TUN IS NULL (NO TUN DEVICE?)
    if [ -z "$CJDNS_TUN" ]; then
      stat_busy "The tun device was not successfully created"
      stat_fail
      exit 1
    fi

    #FAIL IF THE TUN DEVICE IS ALREADY CONFIGURED
    if [ ! $(ifconfig -a | grep -A 1 "$CJDNS_TUN" | grep -c inet6) = 0 ]; then
        if [ ! $(ps -U "$CJDNS_USER" | grep -c cjdroute) = 0 ]; then
            stat_busy "The daemon is already running"
            stat_fail
            exit 1
        fi
        removetun
    fi

    #START CJDNS AND ENABLE THE DAEMON IF IT SUCCEEDS
    if [ -z "$PID" ]; then
        sed -e "s/\"tunDevice\":\ \"tun[^\ ]*/\"tunDevice\":\ \"$CJDNS_TUN\"/g ; s/\"setuser\":\ \"[^\"]*\"/\"setuser\":\ \"$CJDNS_USER\"/g" "$CJDNS_CONFIG" | cjdroute >& "$CJDNS_LOG" &
      if [ $? -gt 0 ]; then
        stat_busy "Unable to start the daemon"
        removetun
        stat_fail
        exit 1
      else
        ifconfig "$CJDNS_TUN" up
        add_daemon cjdns
        stat_done
      fi
    else
      stat_busy "The daemon is already running"
      removetun
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping cjdroute"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_busy "The daemon was not running"
      stat_fail
    else
      rm_daemon cjdns
      stat_done
    fi
    removetun
    ;;
  restart)
    $0 stop
    while [ ! -z "$PID" -a -d "/proc/$PID" ]; do sleep 1; done
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
