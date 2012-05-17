#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON="dnc-server"
NAME="DNC Server daemon"

[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

case "$1" in
 start)
   stat_busy "Starting $NAME"
   ps -u $USER >/dev/null
   if [ $? -ne 0 ]; then
    chmod 644 `FindHardPath`
    mkdir -m 777 /tmp/dancy > /dev/null 2>&1
    mkdir -m 777 /tmp/dancy/upload_log > /dev/null 2>&1
    mkdir -m 777 /tmp/dancy/unload_log > /dev/null 2>&1
    mkdir -m 777 /tmp/dancy/postgres_log > /dev/null 2>&1
    mkdir -m 777 /tmp/dancy/conf > /dev/null 2>&1
    #/usr/bin/dnc_update
    let index=0
    su $USER -c "/usr/bin/upload > /tmp/upload_daemon.out"
    if [ $? = 0 ]; then 
     echo "upload startted"
     let index=$index+1
    fi
    su $USER -c "/usr/bin/daemon_unload > /tmp/unload_daemon.out"
    if [ $? = 0 ]; then 
     echo "daemon_upload startted"
     let index=$index+1
    fi
    su $USER -c "/usr/bin/dnc_edsd&">/dev/null
    if [ $? = 0 ]; then 
     echo "dnc_edsd startted"
     let index=$index+1
    fi
    if [ $index = 3 ]; then
     add_daemon $DAEMON
     stat_done
    else
     stat_fail
     exit 1
    fi
   else
    stat_fail
    exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $NAME"
   killall -u $USER &>/dev/null
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
 status)
   stat_busy "Checking $NAME status";
   ck_status $DAEMON
   ;;
 *)
   echo "usage: $0 {start|stop|restart|status}"  
esac
