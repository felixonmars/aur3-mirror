#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions
PID=`pidof -o %PPID /usr/bin/aria2c`
case "$1" in
  start)
    stat_busy "Starting aria2"
    
    [ -z "$PID" ] && su -l -s /bin/sh -c "/usr/bin/aria2c --conf-path=/etc/aria2.conf" aria2
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon aria2
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping aria2"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon aria2
      stat_done
    fi
    ;;
  restart)
    $0 stop
    while [ ! -z "$PID" -a -d "/proc/$PID" ]; do sleep 1; done
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac

