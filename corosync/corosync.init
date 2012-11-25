#!/bin/bash

# Authors:
#  Eric Renfro <erenfro@gmail.com>

desc="Corosync Cluster Engine"
prog="corosync"

# set secure PATH
PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/sbin"

status()
{
	pid=$(pidof $prog 2>/dev/null)
	return $?
}

if [ -d /etc/default ]; then
	[ -f /etc/default/$prog ] && . /etc/default/$prog
	[ -z "$LOCK_FILE" ] && LOCK_FILE="/var/lock/$prog"
fi

cluster_disabled_at_boot()
{
       if grep -q nocluster /proc/cmdline && \
          [ "$(tty)" = "/dev/console" ]; then
               return 1
       fi
       return 0
}

wait_for_ipc()
{
	local try=0
	while [ "$try" -le "20" ]; do
		if corosync-cfgtool -s > /dev/null 2>&1; then
			return 0
		fi
		sleep 0.5
		let try++
	done

	return 1
}

start()
{
	echo -n "Starting $desc ($prog): "

	! cluster_disabled_at_boot && return

	# most recent distributions use tmpfs for /var/run
	# to avoid to clean it up on every boot.
	# they also assume that init scripts will create
	# required subdirectories for proper operations
	mkdir -p /var/run

	if status $prog > /dev/null 2>&1; then
		rtrn=0
	else
		$prog > /dev/null 2>&1

		if ! wait_for_ipc; then
			echo "FAILED"
			rtrn=1
		fi
		touch $LOCK_FILE
		rtrn=0
	fi
	echo "OK"
}

stop()
{
	! status $prog > /dev/null 2>&1 && return

	echo -n "Signaling $desc ($prog) to terminate: "
	kill -TERM $(pidof $prog) > /dev/null 2>&1
	echo "OK"

	echo -n "Waiting for $prog services to unload:"
	while status $prog > /dev/null 2>&1; do
		sleep 1
		echo -n "."
	done

	rm -f $LOCK_FILE
	echo " OK"
	rtrn=0
}

restart()
{
	stop
	start
}

rtrn=0

case "$1" in
start)
	start
	;;
restart|reload|force-reload)
	restart
	;;
condrestart|try-restart)
	if status $prog > /dev/null 2>&1; then
		restart
	fi
	;;
status)
	status $prog
	rtrn=$?
	;;
stop)
	stop
	;;
*)
	echo "usage: $0 {start|stop|restart|reload|force-reload|condrestart|try-restart|status}"
	rtrn=2
	;;
esac

exit $rtrn

