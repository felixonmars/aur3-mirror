#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=/usr/bin/timeoutd
PID=$(pidof -o %PPID $DAEMON)

start() {
  stat_busy "Starting timeoutd"

  [ -z "$PID" ] && rm -f /var/run/timeoutd.pid && \
    $DAEMON &>/dev/null

  if [ $? -gt 0 ]; then
    stat_fail
  else
    add_daemon timeoutd
    stat_done
  fi
}

stop() {
  stat_busy "Stopping timeoutd"

  [ ! -z "$PID" ]  && kill $PID &> /dev/null

  if [ $? -gt 0 ]; then
    stat_fail
  else
    rm_daemon timeoutd
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
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
