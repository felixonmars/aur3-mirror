#!/bin/bash
daemon_name=riak
riak_bin='/opt/riak/bin/riak';

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	console|attach|'')
		su riak -c "$riak_bin" $@;
		exit $?;
		;;
esac

stat_busy "$1""ing $daemon_name daemon"

err=$(su riak -c "$riak_bin" $@ 2>&1); ret=$?;
echo "$err" | egrep -i '(not responding|already running)' >/dev/null && ret=10;

[ $ret -gt 0 ] && {
	stat_fail;
	echo "$err";
	exit 1;
}

case "$1" in
	start|restart)
		add_daemon $daemon_name
		;;
	stop)
		rm_daemon $daemon_name
		;;
esac

stat_done;
echo "$err";
exit 0;
