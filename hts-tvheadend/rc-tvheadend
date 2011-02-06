#!/bin/bash
#
# HTS Tvheadend daemon rc-script
#

daemon_name=tvheadend
pidfile=/var/run/$daemon_name.pid

. /etc/conf.d/tvheadend
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
 start)
   stat_busy "Starting Tvheadend daemon"
   if [ -z `pidof -o %PPID /usr/bin/$daemon_name` ]; then
     [ -f ${pidfile} ] && rm -f ${pidfile}
     # RUN
     nice -n -1 /usr/bin/$daemon_name $daemon_args
     #
     if [ $? -gt 0 ]; then
       stat_fail
       exit 1
     else
       add_daemon $daemon_name
       stat_done
     fi
   else
     stat_fail
     exit 1
   fi
   ;;

 stop)
   stat_busy "Stopping Tvheadend daemon"
   # KILL
   [ -f ${pidfile} ] && kill `cat ${pidfile}` >/dev/null 2>&1
   #
   if [ $? -gt 0 ]; then
     stat_fail
     exit 1
   else
     rm -f ${pidfile}
     rm_daemon $daemon_name
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

