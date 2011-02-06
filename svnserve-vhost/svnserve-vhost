#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/svnserve-vhost

PID=`pidof -o %PPID /usr/bin/svnserve-vhost`
case "$1" in
  start)
    stat_busy "Starting svnserve-vhost"
    if [ -z "$PID" ]; then 
      if [ -n "$SVNSERVE_USER" ]; then
        su $SVNSERVE_USER -c "/usr/bin/svnserve-vhost --virtual-host -d $SVNSERVE_ARGS" &
      else
        /usr/bin/svnserve-vhost --virtual-host -d $SVNSERVE_ARGS &
      fi
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon svnserve-vhost
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping svnserve-vhost"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon svnserve-vhost
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
