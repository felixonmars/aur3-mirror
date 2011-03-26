#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/sbin/ledd)
case "$1" in
  start)
    stat_busy "Starting ledcontrol"
    [ -z "$PID" ] && /usr/sbin/ledd
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ledcontrol
      chown root:ledcontrol /var/run/ledd-pipe
      chmod 770 /var/run/ledd-pipe
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping ledcontrol"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon ledcontrol
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
