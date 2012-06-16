#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

cmd="/usr/share/shoutcast-trans/bin/sc_trans /etc/shoutcast-trans.conf"
PID=`pidof -o %PPID $cmd`

case "$1" in
	start)
		stat_busy "Starting Shoutcast Transcoder"
		[ ! -d /var/run/shoutcast-trans ] && install -d /var/run/shoutcast-trans
		if [ -z "$PID" ]; then
			 detachtty --dribble-file '/usr/share/shoutcast-trans/server_stdout.log' \
                                 --log-file '/var/log/shoutcast-trans/detachtty.log' \
                                 --pid-file '/usr/share/shoutcast-trans/server.pid' \
                                 '/usr/share/shoutcast-trans/socket' $cmd >/dev/null &
		fi
		if [ ! -z "$PID" -o $? -gt 0 ]; then
			stat_fail
		else
			add_daemon shoutcast-trans
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping Shoutcast Transcoder"
			[ ! -z "$PID" ] && kill $PID &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon shoutcast-trans
			stat_done
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	 attach)
    		attachtty "/usr/share/shoutcast-trans/socket"
    		;;

	*)
		echo "usage: $0 {start|stop|restart|attach}"
		;; esac
exit 0
