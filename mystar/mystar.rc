#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

pid=$(pidof -o %PPID /usr/bin/mystar)

case "$1" in
  start)
    stat_busy "Starting Mystar Supplicant"
    [ -z "$pid" ] && /usr/bin/mystar >/dev/null 2>&1 &
    sleep 1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon mystar
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Mystar Supplicant"
    [ ! -z "$pid" ]  && kill -9 $pid >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon mystar
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
