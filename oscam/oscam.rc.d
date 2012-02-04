#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/oscam

PID=$(pidof -o %PPID /usr/bin/oscam)

case $1 in
  start)
    stat_busy "Starting oscam"

    if [[ -z $PID ]] && /usr/bin/oscam $OSCAM_ARGS; then
        add_daemon oscam
        stat_done
    else
        stat_fail
        exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping oscam"
    if [[ ! -z $PID ]]  && killall /usr/bin/oscam &> /dev/null; then
        rm_daemon oscam
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
