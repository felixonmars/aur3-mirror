#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
  [ -f /var/run/pyicq-t-svn.pid ] && echo `cat /var/run/pyicq-t-svn.pid`
}

case "$1" in
  start)
    stat_busy "Starting jabber ICQ transport daemon"

    [ -f /var/run/pyicq-t-svn.pid ] && rm -f /var/run/pyicq-t-svn.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
      cd /usr/lib/pyicq-t-svn && python2 ./PyICQt.py 1>/dev/null 2>/dev/null &
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon pyicq-t-svn
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping jabber ICQ transport daemon"
    PID=`get_pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/pyicq-t-svn.pid &> /dev/null
      rm_daemon pyicq-t-svn
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
