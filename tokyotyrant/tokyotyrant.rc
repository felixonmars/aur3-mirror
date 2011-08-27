#!/bin/bash

# source config
[ -f /etc/conf.d/ttserver ] && . /etc/conf.d/ttserver

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting TokyoTyrant Server"
    /usr/bin/ttserver ${TYRANT_EXTRA_OPTS} -dmn -pid ${TYRANT_PID_FILE} -log ${TYRANT_LOG_FILE} -port ${TYRANT_PORT} ${TYRANT_DB}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ttserver
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping TokyoTyrant Server"
    if [ -f $TYRANT_PID_FILE ]; then
      pid=`cat "$TYRANT_PID_FILE"`
      kill -TERM "$pid"
      if [ $? -gt 0 ]; then
        stat_fail
      else
        rm_daemon ttserver
        stat_done
      fi
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
