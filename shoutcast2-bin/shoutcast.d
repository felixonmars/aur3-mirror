#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

cmd="/usr/share/shoutcast2/bin/sc_serv /etc/shoutcast2.conf"
PID=`pidof -o %PPID $cmd`

case "$1" in
	start)
		stat_busy "Starting Shoutcast"
		[ ! -d /var/run/shoutcast ] && install -d /var/run/shoutcast
		if [ -z "$PID" ]; then
			 detachtty --dribble-file '/usr/share/shoutcast2/server_stdout.log' \
                                 --log-file '/var/log/shoutcast2/detachtty.log' \
                                 --pid-file '/usr/share/shoutcast2/server.pid' \
                                 '/usr/share/shoutcast2/socket' $cmd >/dev/null &
		fi
		if [ ! -z "$PID" -o $? -gt 0 ]; then
			stat_fail
		else
			add_daemon shoutcast
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping Shoutcast"
			[ ! -z "$PID" ] && kill $PID &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon shoutcast
			stat_done
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	 attach)
    		attachtty "/usr/share/shoutcast2/socket"
    		;;

	*)
		echo "usage: $0 {start|stop|restart|attach}"
		;; esac
exit 0
