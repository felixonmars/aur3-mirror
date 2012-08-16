#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/tvheadend

PID=$(pidof -o %PPID /usr/bin/tvheadend)

case $1 in
  start)
    stat_busy "Starting tvheadend daemon"

    if [[ -z $PID ]] && /usr/bin/tvheadend $TVHEADEND_ARGS; then
        add_daemon tvheadend
        stat_done
    else
        stat_fail
        exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping tvheadend daemon"
    if [[ ! -z $PID ]]  && kill $PID &> /dev/null; then
        rm_daemon tvheadend
        stat_done
    else
        stat_fail
        exit 1
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac
