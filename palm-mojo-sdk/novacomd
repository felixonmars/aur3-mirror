#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /opt/Palm/novacom/novacomd`
case "$1" in
  start)
    stat_busy "Starting Novacom"
    [ -z "$PID" ] && exec /opt/Palm/novacom/novacomd &> /var/log/novacomd.log &
    if [ $? -ne 0 ]; then
      stat_fail
    else
      PID=`pidof -o %PPID /opt/Palm/novacom/novacomd`
      echo $PID >/var/run/novacomd.pid
      add_daemon novacomd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Novacom"
    [ ! -z "$PID" ]  && kill $PID &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      rm_daemon novacom
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
