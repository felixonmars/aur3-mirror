#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/pms

PID=`cat /var/run/pms.pid 2> /dev/null`
[ -z "$PID" ] && PID=`ps -Ao pid,command | grep java | grep pms.jar | awk '{print $1}'`

case "$1" in
	start)
		stat_busy "Starting PS3 Media Server"
		if [ -z "$PID" ]; then
			if [ -n "$PMS_USER" ]; then
				su -s '/bin/sh' $PMS_USER -c "/usr/bin/pms &>> /var/log/pms.log" &
			else
				/usr/bin/pms &>> /var/log/pms.log &
			fi
			PID=$!
			if [ $? -gt 0 ]; then
				stat_fail
			else
				echo $PID > /var/run/pms.pid
				add_daemon pms
				stat_done
			fi
		fi
		;;
	stop)
		stat_busy "Stopping PS3 Media Server"
		[ ! -z "$PID" ]  && kill $PID &> /dev/null
		while ps -p $PID &> /dev/null; do sleep 1; done
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm /var/run/pms.pid 2> /dev/null
			rm_daemon pms
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
		;;
esac
exit 0
