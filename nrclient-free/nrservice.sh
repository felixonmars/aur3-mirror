#!/bin/bash

PATH=/usr/sbin:/usr/bin:/sbin:/bin:
DESC="nrservice"
NAME="nrservice"
RUNPATH=/usr/local/ZebraNetworkSystems/NeoRouter/
DAEMON=nrservice
DAEMON_ARGS=""
PIDFILE=/var/run/$NAME.pid

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Neo Router Client..."
    cd $RUNPATH
    $DAEMON &
    if [ $? -gt 0 ]; then
      stat_fail
     else
      add_daemon $NAME
      pidof $NAME > $PIDFILE
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Neo Router Client..."
    if [ -a $PIDFILE ]; then
      PID=`cat $PIDFILE`
      kill $PID > /dev/null
      if [ $? -gt 0 ]; then
        stat_fail
      else
        rm $PIDFILE
        rm_daemon $NAME
        stat_done
      fi
    else
      pkill $NAME
      if [ $? -gt 0 ]; then
        stat_fail
      else
        stat_done
      fi
    fi
    ;;
  restart|force-reload)
    $0 stop
    sleep 1
    $0 start
    ;;
esac
exit 0
