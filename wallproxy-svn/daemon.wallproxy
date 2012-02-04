#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`cat /var/run/wallproxy.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting wallproxy"
    if [ -z "$PID" ]; then 
			/opt/wallproxy/local/startup.py &> /var/log/wallproxy.log &
			echo $! > /var/run/wallproxy.pid
		fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon wallproxy
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping wallproxy"
    if [ ! -z "$PID" ]; then  
			kill $PID &> /dev/null
			rm /var/run/wallproxy.pid
		fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon wallproxy
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
