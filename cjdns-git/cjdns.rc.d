#!/bin/bash

. /etc/rc.d/functions
. /etc/conf.d/cjdns

PID=`pidof -o %PPID /usr/bin/cjdns`

case "$1" in
  start)
    stat_busy "Starting cjdroute"

    #FAIL IF THE CONFIG DOES NOT EXIST
    if [ ! -f "$CJDNS_CONFIG" -o ! -s "$CJDNS_CONFIG" ]; then
      stat_busy "$CJDNS_CONFIG is missing/empty: run 'cjdroute --genconf > $CJDNS_CONFIG' then configure it"
      stat_fail
      exit 1
    fi

    #START CJDNS AND ENABLE THE DAEMON IF IT SUCCEEDS
    if [ -z "$PID" ]; then
        cat "$CJDNS_CONFIG" | cjdroute > /dev/null
      if [ $? -gt 0 ]; then
        stat_busy "Unable to start the daemon"
        stat_fail
        exit 1
      else
        add_daemon cjdns
        stat_done
      fi
    else
      stat_busy "The daemon is already running"
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping cjdroute"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_busy "The daemon was not running"
      stat_fail
    else
      rm_daemon cjdns
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
