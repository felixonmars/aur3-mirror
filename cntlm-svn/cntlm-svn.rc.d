#!/bin/bash
# Posted by dema on http://paste.org.ru/?pp514s

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=/usr/sbin/cntlm
DAEMON_NAME=cntlm

PID=`pidof -o %PPID $DAEMON`
case "$1" in
  start)
    stat_busy "Starting $DAEMON_NAME"
    [ -z "$PID" ] && $DAEMON
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $DAEMON_NAME
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $DAEMON_NAME"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $DAEMON_NAME
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
