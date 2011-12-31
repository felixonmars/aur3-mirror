#!/bin/bash

daemon_name=restund

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$daemon_name

PID=$(pidof -o %PPID /usr/sbin/$daemon_name)
case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    [ -z "$PID" ] && /usr/sbin/$daemon_name "$RESTUND_ARGS" &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      add_daemon $daemon_name
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $daemon_name"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm_daemon $daemon_name
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;
  *)
    echo "usage: $0 {start|stop|restart|status}"
esac
exit 0
