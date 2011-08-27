#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
case "$1" in
  start)
    stat_busy "Starting PyAxelWS Daemon"
    pkill -f pyaxelws.py &> /dev/null
    python2 /usr/bin/pyaxelws -d /tmp &> /dev/null &
    add_daemon pyaxelws
    stat_done
    ;;
  stop)
    stat_busy "Stopping PyAxelWS Daemon"
    pkill -f pyaxelws.py &> /dev/null
    rm_daemon pyaxelws
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
