#!/bin/bash

. /etc/rc.conf
. /etc/conf.d/sasc-ng
. /etc/rc.d/functions

PID="`pidof -o %PPID sasc-ng`"

case "$1" in
  start)
    [ -z "$SASCNG_ARGS" ] && exit 1
    stat_busy "Starting SASC-NG"
    modprobe dvbloopback $DVBLOOPBACK_ARGS
    sleep 1
    [ -z "$PID" ] && sasc-ng -D $SASCNG_ARGS
    if [ $? -gt 0 ]; then
        stat_fail
    else
        add_daemon sasc-ng
        stat_done
    fi
    ;;
  stop)
    stat_busy "Stoping SASC-NG"
    [ -n "$PID" ] && kill $PID > /dev/null
    if [ $? -gt 0 ]; then
        stat_fail
    else
        rm_daemon sasc-ng
        stat_done
    fi
    modprobe -r dvbloopback
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
    ;;
esac
exit 0
