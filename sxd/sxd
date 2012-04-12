#!/bin/bash
DAEMON=sxd
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$DAEMON
CMD="su - -- $USER -l -c '/usr/bin/startx'"
PID=$(get_pid $CMD)

case "$1" in
 start)
   stat_busy "Starting $DAEMON"
   if [ $USER = "root" ]; then
	echo "Setting the USER variable to root is DANGEROUS, and NOT SUPPORTED.  Please check /etc/conf.d/$DAEMON and choose a non-privileged user for the USER variable."
	stat_fail
	exit 1
   fi
   if [ $USER = "" ]; then
	echo "Please check /etc/conf.d/$DAEMON and choose a non-privileged user for the USER variable."
	stat_fail
	exit 1
   fi
   [ -z "$PID" ] && $CMD
   if [ $? = 0 ]; then
     add_daemon $DAEMON
     stat_done
   else
     stat_fail
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON"
   [ -n "$PID" ] && kill $PID &>/dev/null
   if [ $? = 0 ]; then
     rm_daemon $DAEMON
     stat_done
   else
     stat_fail
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
