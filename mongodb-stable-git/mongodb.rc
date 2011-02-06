#!/bin/bash
# vim: syntax=sh

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof /usr/bin/mongod`
case "$1" in
  start)
    stat_busy "Starting mongod"
    [ -z "$PID" ] && /bin/su mongodb -s /bin/sh -c "/usr/bin/mongod --config /etc/mongodb.conf run &" > /var/log/mongod 2>&1
    if [ $? -gt 0 ] ; then
      stat_fail
    else
      add_daemon mongodb
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping mongod"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ] ; then
      stat_fail
    else
      #wait for the server to finish shutting down
      while [ -n "$(pidof /usr/bin/mongod)" ] ; do
          sleep 1
      done
      rm_daemon mongodb
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0

