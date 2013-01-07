#!/bin/bash
#/etc/rc.d/foldingathome
#
# Starts the Folding@Home client in the background

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=foldingathome
#ARGS=

#[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

PID=$(pidof -x -o %PPID /opt/fah/FAHClient)
case "${1}" in
 start)
   stat_busy "Starting $DAEMON"
   [ -z "${PID}" ] && /opt/fah/FAHClient --config /opt/fah/config.xml --exec-directory=/opt/fah --data-directory=/opt/fah &> /dev/null &
    add_daemon $DAEMON
    if [ ! -z "$PID" -o $? -gt 0 ]; then
     stat_fail
     exit 1
   else
     stat_done
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON"
   [ ! -z "${PID}" ] && kill ${PID} &> /dev/null
   if [ $? -gt 0 ]; then
     stat_fail
   else
     rm_daemon $DAEMON
     stat_done
     exit 1
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
