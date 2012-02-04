#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PATH=/sbin:/bin:/usr/sbin:/usr/bin
DESC="ioReniceD I/O priority Daemon"
NAME="ioreniced"
DAEMON="/sbin/$NAME"
PIDFILE="/var/run/ioreniced.pid"

case "$1" in
	start)
		stat_busy "Starting $DESC"
		
		if [ -e "$PIDFILE" ]
		then
			stat_busy "$DESC already running (or zombie PID file in /var/run/)"
			stat_fail
		else
			$DAEMON &>/dev/null &
			PID="$!"
			sleep 1
				if kill -0 $PID # pid check
				then 
					add_daemon ioreniced
					echo $PID > $PIDFILE
					stat_done
				else
					stat_busy "$DESC isn't starting up properly. Check your Config file."
					stat_fail

					
				fi	
		fi
	;;
	stop)
		stat_busy "Stopping $DESC"
		if [ -f $PIDFILE ]; then
			kill -15 `cat $PIDFILE` &>/dev/null
			rm $PIDFILE
		else
			stat_busy "$DESC not running"
			stat_fail
			exit
		fi
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon ioreniced
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
