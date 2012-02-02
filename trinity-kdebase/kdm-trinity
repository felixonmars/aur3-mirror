#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /opt/trinity/bin/kdm`
case "$1" in
   start)
      #Check for running kdm, start when not running
      stat_busy "Starting TDM Desktop Manager"
      [ -z "$PID" ] && /opt/trinity/bin/kdm &> /dev/null
	   if [ $? -gt 0 ]; then
         stat_fail
      else
         echo $PID > /var/run/kdm.pid
         add_daemon kdm-trinity
         stat_done
      fi
      ;;
   stop)
      stat_busy "Stopping TDM Desktop Manager"
      [ ! -z "$PID" ] && kill $PID &> /dev/null
      if [ $? -gt 0 ]; then
         stat_fail
      else
         rm_daemon kdm-trinity
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
      ;;
esac
exit 0
