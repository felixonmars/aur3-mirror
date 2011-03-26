#!/bin/bash
#
# agnLogd:	Starts the AGNS Log Daemon
#

. /etc/rc.conf
. /etc/rc.d/functions

PID="$(cat /var/run/agnLogd.pid 2>/dev/null)"

case "$1" in
  start)
    stat_busy "Starting AGNS Log Daemon"
    /opt/agns/bin/agnLogd  &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon agnLogd
      stat_done
    fi
    ;;
  stop) 
    stat_busy "Stopping AGNS Log Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon agnLogd
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
exit 0
}

# See how we were called.
case "$1" in
    start)
	start
	;;
    stop)
	stop
	;;
    status)
        status agnLogd
	RETVAL=$?
        ;;
    restart)
	stop
	start
	;;
    condrestart)
	if [ -f /var/lock/subsys/agnLogd ]; then
	    stop
	    start
	fi
	;;
    reload)
  	killproc agnLogd -HUP
	RETVAL=$?
        ;;
    *)
	echo $"Usage: $0 {start|stop|status|restart|condrestart|reload}"
	;;
esac
exit $RETVAL

