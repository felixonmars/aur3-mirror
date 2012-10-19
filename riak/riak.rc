#!/bin/bash
daemon_name=riak
riak_bin='/opt/riak/bin/riak';

. /etc/rc.conf
. /etc/rc.d/functions

stat_busy "$1""ing $daemon_name daemon"

case "$1" in
	start|restart)
		res=$(su -c riak -c "$riak_bin $@" 2>&1)
		if [ $? -gt 0 ]; then
			stat_fail
			echo "$res"
			exit 1
		else
			add_daemon $daemon_name
		fi
		;;
	stop)
		res=$(su -c riak -c "$riak_bin $@" 2>&1)
		ret=$?
		rm_daemon $daemon_name
		;;
	ping|attach|console)
		su -c riak -c "$riak_bin $@"
		exit $?
		;;
	*)
		echo "usage: $0 {start|stop|restart|console|attach|ping}"
		;;
esac

stat_done;
exit 0;
