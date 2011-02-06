#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting fripp"
    /usr/bin/fripp &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon fripp
      stat_done
    fi;;
  stop)
    stat_busy "Stopping fripp"
    killall fripp
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon fripp
      stat_done
    fi;;
  restart)
    $0 stop
    sleep 1
    $0 start;;
  *)
    echo "usage $0 {start|stop|restart}"
esac
