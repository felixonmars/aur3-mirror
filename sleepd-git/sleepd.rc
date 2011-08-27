#!/bin/bash

daemon_bin=/usr/sbin/sleepd
daemon_name=sleepd
daemon_desc="sleep daemon"

test -f $daemon_bin || exit 1

. /etc/rc.conf
. /etc/rc.d/functions

PARAMS=()
[ -r /etc/conf.d/$daemon_name ] && . /etc/conf.d/$daemon_name

#set -e		# terminate script on any error?

function get_pid {
	pidof -o %PPID $daemon_bin
}

case "$1" in
	start)
		# Ensure apm module is loaded.
		# test -e /dev/apm_bios && touch /dev/apm_bios
		# do hal (and acpi) need to be started?
		ck_daemon hal && /etc/rc.d/hal start

    		stat_busy "Starting $daemon_desc"
		PID=`get_pid`
		if [ -z "$PID" ]; then
			[ -f /var/run/$daemon_name.pid ] && rm -f /var/run/$daemon_name.pid
			$daemon_bin "${PARAMS[@]}"
			if [ $? -eq 0 ]; then
				echo `get_pid` > /var/run/$daemon_name.pid
		       		add_daemon $daemon_name
			 	stat_done
				exit 0
			fi	
		fi
		stat_fail
		;;
	stop)
    		stat_busy "Stopping $daemon_desc"
		PID=`get_pid`
		[ ! -z "$PID" ] && kill $PID &> /dev/null 
		if [ $? -eq 0 ]; then
			rm -f /var/run/$daemon_name.pid &> /dev/null
			rm_daemon $daemon_name
			stat_done
			exit 0
		fi
		stat_fail
		;;
	restart|force-reload)
		$0 stop
		sleep 1
		$0 start
		exit $?
		;;
	*)
		echo "Usage: $0 {start|stop|restart}" >&2
esac
exit 1
