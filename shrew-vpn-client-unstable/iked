#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
       pidof iked
}

case "$1" in
 start)
   stat_busy "Starting iked Daemon"

   PID="$(get_pid)"
   if [ -z "$PID" ]; then
     [ -f /var/run/iked.pid ] && rm -f /var/run/iked.pid
     iked > /dev/null
     if [ $? -gt 0 ]; then
       stat_fail
       exit 1
     else
       echo "$(get_pid)" > /var/run/iked.pid
       add_daemon iked
       stat_done
     fi
   else
     stat_fail
     exit 1
   fi
   ;;

 stop)
   stat_busy "Stopping iked Daemon"
   PID="$(get_pid)"
   [ ! -z "$PID" ] && kill $PID &> /dev/null
   if [ $? -gt 0 ]; then
     stat_fail
     exit 1
   else
     rm -f /var/run/iked.pid &> /dev/null
     rm_daemon iked
     stat_done
   fi
   ;;

 restart)
   $0 stop
   sleep 3
   $0 start
   ;;
 *)
   echo "usage: $0 {start|stop|restart}"
esac
exit 0

