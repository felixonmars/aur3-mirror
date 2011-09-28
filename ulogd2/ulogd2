#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	pidof /usr/sbin/ulogd2
}

case "$1" in
  start)
    stat_busy "Starting ulogd2"

    [ -f /var/run/ulogd2.pid ] && rm -f /var/run/ulogd2.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
       /usr/sbin/ulogd2 -d -c /etc/ulogd2.conf
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo `get_pid` > /var/run/ulogd2.pid
        add_daemon ulogd2
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping ulogd2"
    PID=`get_pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/ulogd2.pid &> /dev/null
      rm_daemon ulogd2
      stat_done
    fi
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
