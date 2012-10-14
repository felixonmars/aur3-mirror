#!/bin/bash

daemon_name=ptokax

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/ptokax

PIDFILE=/var/run/ptokax.pid
get_pid() {
	pidof -o %PPID $daemon_name
}

if [ ! -e /var/log/ptokax.log ]; then
  touch /var/log/ptokax.log &&
  chown ptokax:ptokax /var/log/ptokax.log
fi

case "$1" in
	start)
		stat_busy "Starting DC Hub PtokaX daemon"

		PID=$(get_pid)
		if [[ -z $PID ]]; then
			[[ -f /var/run/ptokax.pid ]] &&
				rm -f /var/run/ptokax.pid
		# RUN
		/usr/bin/ptokax $PTOKAX_ARGS
		#
		if [[ $? -gt 0 ]]; then
			stat_fail
			exit 1
		else
			echo $(get_pid) > /var/run/ptokax.pid
			add_daemon ptokax
			stat_done
		fi
		else
			stat_fail
			exit 1
		fi
		;;

	stop)
		stat_busy "Stopping DC Hub PtokaX daemon"
		PID=$(get_pid)
		# KILL
		[[ -n $PID ]] && kill -9 $PID &> /dev/null
		#
		if [[ $? -gt 0 ]]; then
			stat_fail
			exit 1
		else
			rm -f /var/run/ptokax.pid &> /dev/null
			rm_daemon ptokax
			stat_done
		fi
		;;

	restart)
		$0 stop
		sleep 4
		$0 start
		;;

	status)
		stat_busy "Checking DC Hub PtokaX status";
		ck_status ptokax
		;;

	*)
		echo "usage: $0 {start|stop|restart|status}"
esac

exit 0

# vim:set ts=2 sw=2 et:
