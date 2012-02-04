#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/wgetd.conf


pid=$(pidof -o %PPID /usr/bin/wgetd)

case "$1" in
  start)
    stat_busy "Starting wget daemon"
    [ -z "$pid" ] && /usr/bin/wgetd $WGETD_JDIR $WGETD_DLDIR $WGETD_TMPDIR $WGETD_TIME > /dev/null & 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon wgetd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping wget daemon"
    rm -f $lockfile
    [ ! -z "$pid" ]  && kill $pid >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon wgetd
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
