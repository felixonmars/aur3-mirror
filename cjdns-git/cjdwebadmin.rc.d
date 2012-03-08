#!/bin/bash

. /etc/rc.d/functions
. /etc/conf.d/cjdwebadmin

PID=`pidof -o %PPID /usr/bin/cjdwebadmin`

case "$1" in
  start)
    stat_busy "Starting the cjdns web admin"
    if [ -z "$PID" ]; then
      sudo -u cjdns cjdwebadmin $CJDWEBADMIN_ADDR $CJDWEBADMIN_PATH/ >& "$CJDWEBADMIN_LOG" &
      if [ $? -gt 0 ]; then
        echo -n "Unable to start the cjdns web admin"
        stat_fail
        exit 1
      else
        echo -n "You can now access the cjdns web admin @ http://[::1]:51902"
        add_daemon cjdwebadmin
        stat_done
      fi
    else
      echo -n "The cjdns web admin is already running"
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping The cjdns web admin"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      echo -n "The cjdns web admin was not running"
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
