#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/local/sbin/olsrd`
case "$1" in
  start)
    stat_busy "Starting OLSR Daemon"
    [ -z "$PID" ] && /usr/local/sbin/olsrd -d 0 &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon olsrd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping OLSR Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon olsrd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0

