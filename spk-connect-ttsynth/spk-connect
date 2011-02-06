#!/bin/bash

. /etc/rc.conf
. /etc/conf.d/spk-connect
. /etc/rc.d/functions

PID=`pidof spk-connect`
PIDFILE=/var/run/spk-connect.pid
case "$1" in
  start)
    stat_busy "Starting spk-connect"
    if [ -z "$PID" ]; then
      if [ -f $PIDFILE ]; then
        rm $PIDFILE
      fi
      /usr/bin/spk-connect-ttsynth $SPK_CONNECT_ARGS
      if [ $? -gt 0 ]; then
        stat_fail
      else
        add_daemon spk-connect
        stat_done
      fi
    fi
    ;;
  stop)
    stat_busy "Stopping spk-connect"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon spk-connect
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
