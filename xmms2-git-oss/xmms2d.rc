#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/xmms2d.conf

PID=`pidof xmms2d xmms2-et`
case "$1" in
  start)
    stat_busy "Starting xmms2d"
    [ -z "$PID" ] && su -c '/usr/bin/xmms2-launcher $XMMS2_PARAMETERS 1>/dev/null 2>/dev/null' - $XMMS2_USER
    sleep 1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon xmms2d
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping xmms2d"
    [ ! -z "$PID" ] && su -c '/usr/bin/xmms2 quit &>/dev/null' - $XMMS2_USER
    sleep 4
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon xmms2d
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0