#!/bin/bash

# source application-specific settings
INPUTLIRCD_ARGS=
[ -f /etc/conf.d/inputlircd ] && . /etc/conf.d/inputlircd

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/inputlircd`
case "$1" in
  start)
    stat_busy "Starting InputLIRCd Daemon"
    [ -z "$PID" ] && /usr/sbin/inputlircd ${INPUTLIRCD_ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon inputlircd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping InputLIRCd Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon inputlircd
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
