#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=netatalk
ARGS=
DAEMONS=()

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

PID=()

daemons(){
	for i in cnid_metad atalkd papd timelord afpd
	do
		if [ $(type -p $i) ]; then DAEMONS+=($i); PID+=($(get_pid $i)); fi
	done
}
daemons

case "$1" in
 start)
   STARTING=''; rc.d start ${DAEMONS[@]}
   if [ $? = 0 ]; then
     add_daemon $DAEMON
   else
     exit 1
   fi
   ;;
 stop)
   for ((i=${#DAEMONS[@]}-1; i>=0; i--));do rc.d stop ${DAEMONS[$i]}; done
   if [ $? = 0 ]; then
     rm_daemon $DAEMON
   else
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