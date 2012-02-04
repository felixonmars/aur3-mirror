#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions

SHELLINABOXD_ARGS=
[ -f /etc/conf.d/shellinaboxd ] && . /etc/conf.d/shellinaboxd

PID=`pidof -o %PPID /usr/bin/shellinaboxd`
case "$1" in
 start)
   stat_busy "Starting SHELLINABOXD"
   [ -z "$PID" ] && /usr/bin/shellinaboxd ${SHELLINABOXD_ARGS}
   if [ $? -gt 0 ]; then
     stat_fail
   else
     add_daemon shellinaboxd
     stat_done
   fi
   ;;
 stop)
   stat_busy "Stopping SHELLINABOXD"
   [ ! -z "$PID" ]  && kill $PID &> /dev/null
   if [ $? -gt 0 ]; then
     stat_fail
   else
     rm_daemon shellinboxd
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

