#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/bin/noip)
case "$1" in
  start)
    stat_busy "Starting No-IP.com DynDNS Daemon"
    [ -z "$PID" ] && /usr/bin/noip
    PID=$(pidof -o %PPID /usr/bin/noip)
    if [ -z "$PID" ]; then
      stat_fail
    else
      add_daemon noip
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping No-IP.com DynDNS Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon noip
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
