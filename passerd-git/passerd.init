#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Passerd Daemon"
    passerd -d --log-file=/var/log/passerd.log \
    	/var/lib/passerd/data.sqlite 2>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon passerd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Passerd Daemon"
    killall passerd 2>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon passerd
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
