#!/bin/bash

### /etc/rc.d/nslcd: Initscript for `nslcd`

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/nslcd`
case "$1" in
  start)
    stat_busy "Starting nslcd"
    [ -z "$PID" ] && \
      /usr/sbin/nslcd &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done; add_daemon nslcd
    fi ;;
  stop)
    stat_busy "Stopping nslcd"
    [ ! -z "$PID" ] \
      && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done; rm_daemon nslcd
      rm -f /var/run/nslcd.pid
      rm -f /var/run/nslcd.sock
    fi ;;
  restart)
    $0 stop
    sleep 1
    $0 start ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac

exit 0

### /etc/rc.d/nslcd: Initscript for `nslcd`
