#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pgrep supervisord`
case "$1" in
  start)
    stat_busy "Starting Supervisor Daemon"
    [ -z "$PID" ] && /usr/bin/supervisord -j /var/run/supervisor.pid &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon supervisor
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Supervisor Daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon supervisor
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
