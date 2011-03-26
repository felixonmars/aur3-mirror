#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -x -o %PPID /etc/rc.d/timekprd`
case "$1" in
  start)
    stat_busy "Starting timekpr"
    [ -z "$PID" ] && /usr/bin/timekpr &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon timekprd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping timekpr"
    [ ! -z "$PID" ] && killall --user root timekpr &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon timekprd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0			
