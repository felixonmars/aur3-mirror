#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

SYS_LIBDIR="/usr/lib"

PID=`pidof -o %PPID /usr/sbin/openl2tpd`
case "$1" in
  start)
    stat_busy "Starting OpenL2TP Daemon"
    [ -z "$PID" ] && /usr/sbin/openl2tpd -p $SYS_LIBDIR/openl2tp/ppp_unix.so
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon openl2tpd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping OpenL2TP Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon openl2tpd
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
