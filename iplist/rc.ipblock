#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Starting Iplist Daemon"
    /usr/bin/ipblock -s 2>/dev/null 1>&2
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ipblock
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Iplist Daemon"
    /usr/bin/ipblock -d
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon ipblock
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  update)
    stat_busy "Downloading lists";
    /usr/bin/ipblock -u
    stat_done
    stat_busy "Converting lists to ipl format";
    stat_done
    /usr/bin/ipblock -c
    $0 restart
    ;;
  *)
    echo "usage: $0 {start|stop|restart|update}"  
esac
exit 0
