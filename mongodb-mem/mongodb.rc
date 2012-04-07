#!/bin/bash
# vim: syntax=sh

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof /usr/bin/mongod)
case "$1" in
  start)
    if [ ! -d "/tmp/mongodb" ]; then
        /bin/su mongodb -c "mkdir /tmp/mongodb"
    fi
    stat_busy "Starting mongodb"
    [ -z "$PID" ] && /bin/su mongodb -c "/usr/bin/mongod --config /etc/mongodb-mem.conf --fork" > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon mongodb
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping mongodb"
    [ ! -z "$PID" ] && /bin/su mongodb -c "/usr/bin/mongod --config /etc/mongodb-mem.conf --shutdown" &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon mongodb
      while [ ! -z "$(pidof /usr/bin/mongod)" ]; do
        sleep 1;
      done
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
