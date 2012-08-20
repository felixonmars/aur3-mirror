#!/bin/bash
#/etc/rc.d/foldingathome-v7
#
# Starts the Folding@Home-v7 client in the background

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=foldingathome-v7
#ARGS=

#[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

PID=$(pidof -x -o %PPID /opt/fah-v7/FAHClient)
case "${1}" in
 start)
   stat_busy "Starting $DAEMON"
   [ -z "${PID}" ] && /opt/fah-v7/FAHClient --config /opt/fah-v7/config.xml --exec-directory=/opt/fah-v7 --data-directory=/opt/fah-v7 &> /dev/null &
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
