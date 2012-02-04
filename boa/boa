#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/boa`

start() {
  stat_busy "Starting Boa"
  /usr/sbin/boa &>/dev/null
  if [ $? -gt 0 ]; then
    stat_fail
  else
    add_daemon boa
    stat_done
  fi
}

stop() {
  stat_busy "Stopping Boa"
  kill $PID &>/dev/null
  rm_daemon boa
  stat_done
}

case "$1" in
  start)
    start
  ;;

  stop)
    stop
  ;;

  restart)
    stop
    sleep 1
    start
  ;;

  *)
    echo "usage: $0 {start|stop|restart}"
esac
