#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/unscd

BIN=/usr/sbin/unscd
PID=$(pidof -o %PPID $BIN)

case "$1" in
  start)
    stat_busy "Starting unscd"
    [[ -z "$PID" ]] && $BIN $UNSCD_OPTIONS
    if (( $? == 0 )); then
      add_daemon unscd
      stat_done
    else
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping unscd"
    [[ ! -z "$PID" ]]  && kill $PID &> /dev/null
    if (( $? == 0 )); then
      rm_daemon unscd
      stat_done
    else
      stat_fail
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
:
# vim:set ts=2 sw=2 ft=sh noet:
