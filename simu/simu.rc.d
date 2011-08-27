#!/bin/bash

daemon_name=simu

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/simu`
case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    [ -z "$PID" ] && /usr/sbin/simu -f /etc/simu/simu.conf >/dev/null 2>/dev/null &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $daemon_name
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $daemon_name"
    [ ! -z "$PID" ]  && killall $daemon_name &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $daemon_name
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
