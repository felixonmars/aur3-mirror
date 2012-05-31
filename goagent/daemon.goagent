#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`cat /var/run/goagent.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting goagent"
    if [ -z "$PID" ]; then 
			/opt/goagent/local/proxy.py &> /var/log/goagent.log &
			echo $! > /var/run/goagent.pid
		fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon goagent
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping goagent"
    if [ ! -z "$PID" ]; then  
			kill $PID &> /dev/null
			rm /var/run/goagent.pid
		fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon goagent
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
