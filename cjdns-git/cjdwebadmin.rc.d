#!/bin/bash

. /etc/rc.d/functions
. /etc/conf.d/cjdwebadmin

PID=`pidof -o %PPID /usr/bin/cjdwebadmin`

case "$1" in
  start)
    stat_busy "Starting the cjdns admin webserver"
    if [ -z "$PID" ]; then
      sudo -u $CJDNS_USER cjdwebadmin $CJDWEBADMIN_ADDR $CJDWEBADMIN_PATH/ >& "$CJDWEBADMIN_LOG" &
      if [ $? -gt 0 ]; then
        stat_busy "Unable to start the daemon"
        stat_fail
        exit 1
      else
        stat_busy "You can now access the cjdns admin webserver @ http://[::1]:51902"
        add_daemon cjdwebadmin
        stat_done
      fi
    else
      stat_busy "The cjdns admin webserver is already running"
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping The cjdns admin webserver"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_busy "The cjdns admin webserver was not running"
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
