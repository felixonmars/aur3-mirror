#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/autoscan-network-daemon)
case "$1" in
  start)
    stat_busy "Starting autoscan-network-daemon"
    [ -z "$PID" ] && /usr/sbin/autoscan-network-daemon > /var/log/autoscan-network-daemon
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon autoscan-network-daemon
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping autoscan-network-daemon"
    [ ! -z "$PID" ]  && /usr/sbin/autoscan-network-daemon --stop
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon autoscan-network-daemon
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
