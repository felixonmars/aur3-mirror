#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/perl /usr/bin/logsnorter`

case "$1" in
  start)
    if [ "$PID" != "" ]; then
        stat_fail
	echo ":: Daemon already started"
	exit 1    
    else
     stat_busy "Starting logsnorter daemon"
       chown root.logsnorter /var/log/iptables.log
       sudo -b -u logsnorter /usr/bin/perl /usr/bin/logsnorter -t -T /var/log/iptables.log &>/dev/null
       #use /var/log/probes instead when you have a central logging server
     if [ $? -gt 0 ]; then
      stat_fail
     else
      add_daemon logsnorter
      stat_done
     fi
    fi
    ;;
  stop)
    stat_busy "Stopping logsnorter daemon "
    if [ "$PID" != "" ]; then #if PID exists
       kill -KILL $PID &>/dev/null
       stat_done
       if [ $? -gt 0 ]; then
         stat_fail
         exit 1
       else		  
         RETVAL=$?
         rm_daemon iptlogd
       fi
       else   
         stat_fail
         echo ":: Daemon already stopped"
         exit 1
    fi
    ;;	
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  reload)
    if [ -f /var/run/logsnorterd.pid ]; then
      status "Reloading logsnorter daemon" kill -HUP $PID
    fi
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload}"  
esac
