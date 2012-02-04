#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PARAMS=
[ -f /etc/conf.d/amora ] && . /etc/conf.d/amora
PID=$(pidof -o %PPID /usr/bin/amorad)
case "$1" in
  start)
    stat_busy "Starting Amora server"
    [ -z "$PID" ] && /usr/bin/amorad $PARAMS 2>&1 &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon amorad
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stoping Amora server"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon amorad
      stat_done
    fi 
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
