#!/bin/bash

# source application-specific settings
DEVICE=
[ -f /etc/conf.d/hpfall ] && . /etc/conf.d/hpfall

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/hpfall)
case "$1" in
  start)
    stat_busy "Starting HP 3D DriveGuard Daemon"
    [ -z "$PID" ] && /usr/sbin/hpfall ${DEVICE}
    PID=$(pidof -o %PPID /usr/sbin/hpfall)
    if [ -z "$PID" ]; then
      stat_fail
    else
      add_daemon hpfall
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping HP 3D DriveGuard Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon hpfall
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
