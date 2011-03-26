#!/bin/bash
OPTS="-rs -vvv -l /var/log/yate"

# Source function library.
. /etc/rc.conf
. /etc/rc.d/functions

RETVAL=0

# See how we were called.
case "$1" in
    start)
	stat_busy "Starting YATE"
        unset DISPLAY

	yate -d -p /var/run/yate.pid $OPTS
        RETVAL=$?
	if [ $RETVAL -gt 0 ]; then
	    stat_fail
	else
	    add_daemon yate
	    touch /var/lock/yate
	    stat_done
	fi
	;;
    stop)
	stat_busy "Stopping YATE"
	[ -f /var/run/yate.pid ] && kill $(cat /var/run/yate.pid) > /dev/null 2>&1
	RETVAL=$?
	if [ $RETVAL -gt 0 ]; then
	    stat_fail
	else
	    rm -f /var/run/yate.pid
	    rm -f /var/lock/yate
	    rm_daemon yate
	    stat_done
	fi
	;;
    status)
        [ -f /var/run/yate.pid ]  && echo -e "Yate is running" || echo -e "Yate is not running"
        ;;
    restart)
	$0 stop
	sleep 1
	$1 start
	;;
    condrestart)
	if [ -f /var/lock/yate ]; then
	    $0 stop
	    $0 start
	fi
	;;
    reload)
  	pkill yate -HUP
	RETVAL=$?
        ;;
    *)
	echo $"Usage: $0 {start|stop|status|restart|condrestart|reload}"
	;;
esac
exit $RETVAL
