#!/bin/bash

. /etc/rc.d/functions
. /etc/conf.d/cjdns

PID=`pidof -o %PPID /usr/bin/cjdroute`

function removetun {
    if [ ! $(ip tuntap list | grep -c `id -u cjdns`) = 0 ]; then
      CJDNS_TUN=$(ip tuntap list | grep -m1 `id -u cjdns` | grep -o -E "^tun[^\:]*")
      ifconfig "$CJDNS_TUN" down
      ip tuntap del mode tun "$CJDNS_TUN"
    fi
}

case "$1" in
  start)
    stat_busy "Starting cjdroute"

    #FAIL IF THE CONFIG OR USER DO NOT EXIST
    if [ ! -f "$CJDNS_CONFIG" -o ! -s "$CJDNS_CONFIG" ]; then
      echo -n "$CJDNS_CONFIG is missing/empty: run 'cjdroute --genconf > $CJDNS_CONFIG' then configure it"
      stat_fail
      exit 1
    elif [ $(grep -c cjdns /etc/passwd) = 0 ]; then
      echo -n "The cjdns user does not exist"
      stat_fail
      exit 1
    fi

    #CREATE TUN DEVICE IF IT DOESN'T ALREADY EXIST
    if [ $(ip tuntap list | grep -c `id -u cjdns`) = 0 ]; then
      ip tuntap add mode tun user cjdns
    fi

    #SET $CJDNS_TUN TO THE FIRST TUN DEVICE OWNED BY USER 'cjdns'
    CJDNS_TUN=$(ip tuntap list | grep -m1 `id -u cjdns` | grep -o -E "^tun[^\:]*")
    #FAIL IF $CJDNS_TUN IS NULL (NO TUN DEVICE?)
    if [ -z "$CJDNS_TUN" ]; then
      echo -n "The tun device was not successfully created"
      stat_fail
      exit 1
    fi

    #FAIL IF THE TUN DEVICE IS ALREADY CONFIGURED
    if [ ! $(ifconfig -a | grep -A 1 "$CJDNS_TUN" | grep -c inet6) = 0 ]; then
      echo -n "The tun device is already configured: stop cjdns and try again"
      stat_fail
      exit 1
    fi

    #CONFIGURE THE TUN DEVICE TO REFLECT THE CONFIG (NO LONGER NEEDED WHEN RUNNING AS ROOT, WHICH WE ARE)
    #sed -e "s/\"tunDevice\":\ \"tun[^\ ]*/\"tunDevice\":\ \"$CJDNS_TUN\"/g ; s/\"setuser\":\ \"[^\"]*\"/\"setuser\":\ \"cjdns\"/g" "$CJDNS_CONFIG" | cjdroute --getcmds | sh

    #START CJDNS AND ENABLE THE DAEMON IF IT SUCCEEDS
    if [ -z "$PID" ]; then
        sed -e "s/\"tunDevice\":\ \"tun[^\ ]*/\"tunDevice\":\ \"$CJDNS_TUN\"/g ; s/\"setuser\":\ \"[^\"]*\"/\"setuser\":\ \"cjdns\"/g" "$CJDNS_CONFIG" | cjdroute >& "$CJDNS_LOG" &
      if [ $? -gt 0 ]; then
        echo -n "Unable to start cjdroute"
        removetun
        stat_fail
        exit 1
      else
        ifconfig "$CJDNS_TUN" up
        add_daemon cjdns
        stat_done
      fi
    else
      echo -n "cjdns is already running"
      removetun
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping cjdroute"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      echo -n "cjdns was not running"
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
