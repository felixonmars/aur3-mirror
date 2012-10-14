#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# Path to the PID-file
PIDFILE="/var/run/razerd/razerd.pid"

case "$1" in
  start)
    stat_busy "Starting razerd"
    razerd -B -P $PIDFILE &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon razerd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping razerd"
    if [ -r "$PIDFILE" ]; then
      kill `cat $PIDFILE` &> /dev/null
      if [ $? -gt 0 ]; then
        stat_fail
      else
        rm_daemon razerd
        stat_done
      fi
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
exit 0
