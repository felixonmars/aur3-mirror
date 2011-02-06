#!/bin/bash

# source application-specific settings
WWWOFFLE_ARGS=
[ -f /etc/conf.d/wwwoffle ] && . /etc/conf.d/wwwoffle

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/wwwoffled`
case "$1" in
  start)
    stat_busy "Starting wwwoffle"
    [ -z "$PID" ] && /usr/sbin/wwwoffled ${WWWOFFLE_ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon wwwoffle
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping wwwoffle"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon wwwoffle
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 5
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
