#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/msn-proxy`
case "$1" in
  start)
    stat_busy "Starting MSN-PROXY Daemon"
    [ -z "$PID" ] && /usr/bin/msn-proxy -f /etc/msn-proxy &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon msn-proxy
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping MSN-PROXY Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon msn-proxy
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
