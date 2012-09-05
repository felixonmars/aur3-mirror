#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/logkeysd

PID=$(pidof -o %PPID /usr/bin/logkeys)

start() {
  stat_busy "Starting logkeys"

  [ -z "$PID" ] && rm -f /var/run/logkeys.pid && \
    logkeys --start $LOGKEYS_PARAMS 2>/dev/null

  if [ $? -gt 0 ]; then
    stat_fail
  else
    add_daemon logkeys
    stat_done
  fi
}

stop() {
  stat_busy "Stopping logkeys"

  [ ! -z "$PID" ]  && logkeys --kill &> /dev/null

  if [ $? -gt 0 ]; then
    stat_fail
  else
    rm_daemon logkeys
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
