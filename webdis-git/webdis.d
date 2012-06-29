#!/bin/bash

daemon_name=webdis

. /etc/rc.conf
. /etc/rc.d/functions

EXEC=/usr/bin/webdis
PIDFILE=/var/run/webdis.pid
WORKDIR=/var/lib/webdis
CONF="/etc/webdis.prod.json"

# Check if process exists
PID=$(cat $PIDFILE 2>/dev/null)
[ -d /proc/${PID} ] || rm -f $PIDFILE

case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    [ -d $WORKDIR ] || mkdir $WORKDIR

    if [ -f $PIDFILE ]; then
      stat_fail
      exit 1
    else
      $EXEC $CONF >/dev/null
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon $daemon_name
        stat_done
      fi
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name"

    if [ ! -f $PIDFILE ]; then
      stat_fail
      exit 1
    else
      PID=$(cat $PIDFILE)
      [ -d /proc/${PID} ] && kill -9 $PID
      [ -d /proc/${PID} ] && stat_fail || { stat_done; rm_daemon $daemon_name; }
    fi
    ;;

  restart)
    $0 stop
    sleep 1
    $0 start
    ;;

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"  
esac
exit 0
