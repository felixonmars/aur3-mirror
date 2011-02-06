#!/bin/bash
#universal daemon controller
# general config
. /etc/rc.conf
. /etc/rc.d/functions

daemonid="busybox-httpd"				#arch-style daemon identification
binary="/usr/bin/busybox-httpd"			#daemon binary
pidfile="/var/run/$daemonid.pid"		#maybe you don't need to change this...
description="BusyBox HTTP Daemon"		#daemon description...

PID=$(cat "$pidfile" 2>/dev/null);

case "$1" in
  start)
    stat_busy "Starting $description"
    [ -z "$PID" ] && "$binary" "$pidfile" 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon "$daemonid"
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $description"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      rm -f "$pidfile"
      stat_fail
    else
      rm_daemon "$daemonid"
      rm -f "$pidfile"
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
