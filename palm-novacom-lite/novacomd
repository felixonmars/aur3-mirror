#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/novacomd ] && . /etc/conf.d/novacomd

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /opt/Palm/novacom/novacomd`

start() {
  stat_busy "Starting Palm Novacom service"
  export LD_LIBRARY_PATH=/opt/Palm/novacom 
  [ -z "$PID" ] && exec /opt/Palm/novacom/novacomd $NOVACOMD_OPTIONS &>/dev/null &
  if [ $? -gt 0 ]; then
    stat_fail
  else
    add_daemon novacomd
    stat_done
  fi
}

stop() {
  stat_busy "Stopping Palm Novacom service"
  [ ! -z "$PID" ]  && kill $PID
  if [ $? -gt 0 ]; then
    stat_fail
  else
    rm_daemon novacomd
    stat_done
  fi
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    # calling 'stop' and 'start' without the $0 fails...
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
