#!/bin/bash

# general config
. /etc/rc.conf
. /etc/conf.d/btpd
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting BitTorrent Protocol Daemon"
    /usr/bin/btpd $BTPD_ARGS &> /dev/null

    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping BitTorrent Protocol Daemon"
    /usr/bin/btcli kill &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
