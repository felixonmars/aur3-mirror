#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

MPID=`pidof -o %PPID gnhost\(main\)`
WPID=`pidof -o %PPID gnhost\(worker\)`

case "$1" in
  start)
    stat_busy "Starting Gnhostlinux"
    if [ -z "$MPID" -a -z "$WPID" ]; then
	    /usr/sbin/gnhostlinux
    fi
    if [ ! -z "$MPID" -o ! -z "$WPID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon gnhostlinux
      stat_done
    fi
    ;;
 stop)
   stat_busy "Stopping Gnhostlinux"
    [ ! -z "$MPID" ]  && kill $MPID &> /dev/null
    [ ! -z "$WPID" ]  && kill $WPID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon fam
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
esac
