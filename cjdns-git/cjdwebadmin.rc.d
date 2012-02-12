#!/bin/bash

. /etc/rc.d/functions
. /etc/conf.d/cjdwebadmin

PID=`pidof -o %PPID /usr/bin/cjdwebadmin`

case "$1" in
  start)
    stat_busy "Starting CJD Web Admin"
    if [ -z "$PID" ]; then
      sudo -u cjdns cjdwebadmin $CJDWEBADMIN_ADDR $CJDWEBADMIN_PATH/ >& "$CJDWEBADMIN_LOG" &
      if [ $? -gt 0 ]; then
        echo -n "Unable to start cjdroute"
        stat_fail
        exit 1
      else
        echo -n "You can now access the CJD Web Admin @ http://localhost:51902/"
        add_daemon cjdwebadmin
        stat_done
      fi
    else
      echo -n "CJD Web Admin is already running"
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping CJD Web Admin"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      echo -n "CJD Web Admin was not running"
      stat_fail
    else
      rm_daemon cjdwebadmin
      stat_done
    fi
    ;;
  restart)
    $0 stop
    while [ ! -z "$PID" -a -d "/proc/$PID" ]; do sleep 1; done
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
