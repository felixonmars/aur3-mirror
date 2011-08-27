#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

boxexec=wapbox
boxexec_full_path=/usr/sbin/$boxexec
configfile_path=/etc/kannel.conf

CMD="/usr/sbin/run_kannel_box $boxexec_full_path $configfile_path"
PID=`pidof -o %PPID $CMD`

case "$1" in
  start)
    stat_busy "Starting $boxexec"
    [ -z "$PID" ] && $CMD &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $boxexec
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $boxexec"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $boxexec
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
