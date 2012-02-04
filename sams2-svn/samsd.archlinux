#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

EXE=/usr/bin/sams2daemon
LOCKFILE=/var/lock/samsd
RETVAL=0

PID=`pidof -o %PPID $EXE`

case "$1" in
  start)
    stat_busy "Starting SAMS Daemon"
    [ -z "$PID" ] && $EXE
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon samsd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping SAMS Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon samsd
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
