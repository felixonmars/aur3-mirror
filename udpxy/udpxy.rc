#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions
UDPXYOPTS=
[ -f /etc/conf.d/udpxy ] && . /etc/conf.d/udpxy
PID=`pidof -o %PPID /usr/bin/udpxy`
case "$1" in
 start)
   stat_busy "Starting udpxy"
   [ -z "$PID" ] && /usr/bin/udpxy ${UDPXYOPTS}
   if [ $? -gt 0 ]; then
     stat_fail
   else
     add_daemon udpxy
     stat_done
   fi
   ;;
 stop)
   stat_busy "Stopping udpxy"
   [ ! -z "$PID" ]  && kill $PID &> /dev/null
   if [ $? -gt 0 ]; then
     stat_fail
   else
     rm_daemon udpxy
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

