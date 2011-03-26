#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	pidof /usr/bin/ipcad
}

case "$1" in
  start)
    stat_busy "Starting ipcad daemon"

    [ -f /var/run/ipcad.pid ] && rm -f /var/run/ipcad.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
       /usr/bin/ipcad -rds >> /var/log/ipcad.log 2>> /var/log/ipcad.log
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo `get_pid` > /var/run/ipcad.pid
        add_daemon ipcad
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping ipcad daemon"
    PID=`get_pid`
    [ ! -z "$PID" ] && rsh localhost shutdown &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/ipcad.pid &> /dev/null
      rm_daemon ipcad
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
