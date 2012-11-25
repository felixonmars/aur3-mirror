#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PIDFILE=/var/run/cassandra.pid
if [ -f "${PIDFILE}" ]; then
	PID=$(cat /var/run/cassandra.pid)
fi
case "$1" in
  start)
    stat_busy "Starting Cassandra Daemon"
    [ -z "${PID}" ] && /usr/bin/cassandra -p ${PIDFILE} &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon cassandra
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Cassandra Daemon"
    [ ! -z "${PID}" ]  && kill ${PID} &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm ${PIDFILE}
      rm_daemon cassandra
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
