#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	[ -f /var/run/j2j.pid ] && echo `cat /var/run/j2j.pid`
}

case "$1" in
  start)
    stat_busy "Starting j2j transport daemon"

    [ -f /var/run/j2j.pid ] && rm -f /var/run/j2j.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
      cd /usr/share/j2j && python ./main.py 1>/dev/null 2>/dev/null &
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon j2j
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping j2j transport daemon"
    PID=`get_pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/j2j.pid &> /dev/null
      rm_daemon j2j
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
