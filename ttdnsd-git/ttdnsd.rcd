#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/ttdnsd ] && . /etc/conf.d/ttdnsd

PID=`pidof -o %PPID /usr/sbin/ttdnsd`
case "$1" in
  start)
    stat_busy "Starting Tor TCP DNS Daemon"
    [ -z "$PID" ] && /usr/sbin/ttdnsd -P /run/ttdnsd.pid -f /etc/ttdnsd.conf -C /var/lib/ttdnsd $DEFAULTS &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ttdnsd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Tor TCP DNS Daemon"
#   [ ! -z "$PID" ] && kill -INT $PID &> /dev/null
    [ ! -z "$PID" ] && kill      $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      [ -f /run/ttdnsd.pid ] && rm -f /run/ttdnsd.pid
      rm_daemon ttdnsd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
# vim: ft=sh ts=2 sw=2
