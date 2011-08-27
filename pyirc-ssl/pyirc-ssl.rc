#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
  [ -f /var/run/pyirct-ssl.pid ] && echo `cat /var/run/pyirct-ssl.pid`
}

case "$1" in
  start)
    stat_busy "Starting jabber IRC-SSL transport daemon"

    [ -f /var/run/pyirct-ssl.pid ] && rm -f /var/run/pyirct-ssl.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
      cd /usr/lib/pyirc-ssl && python2 ./irc.py 1>/dev/null 2>/dev/null &
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon pyirct-ssl
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping jabber IRC-SSL transport daemon"
    PID=`get_pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/pyirct-ssl.pid &> /dev/null
      rm_daemon pyirct-ssl
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
