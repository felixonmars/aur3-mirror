#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

ATFTPD_ARGS=
[ -f /etc/conf.d/atftpd ] && . /etc/conf.d/atftpd

PID=$(pidof -o %PPID /usr/sbin/atftpd)
case "$1" in
  start)
    stat_busy "Starting Advanced TFTPD"
    [ -z "$PID" ] && /usr/sbin/atftpd ${ATFTPD_ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon tftpd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Advanced TFTPD"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon tftpd
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
