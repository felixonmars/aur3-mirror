#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions


rserver=/usr/lib/rstudio/bin/rserver
NAME=rserver

case "$1" in
  start)
    stat_busy "Starting R-Studio-Server ..."
    $rserver --server-daemonize=1 &> /dev/null && { add_daemon $NAME; stat_done; } || stat_fail
    ;;
  stop)
    stat_busy "Stopping R-Studio-Server ..."
    killall $NAME && &> /dev/null &&  { rm_daemon $NAME; stat_done; } || stat_fail
    ;;
  restart)
    $0 stop
    sleep 5
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0



