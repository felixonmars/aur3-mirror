#!/bin/sh
#
# Nanoweb start/stop script - by Vincent Negrier <six@aegis-corp.org>
#

. /etc/rc.conf
. /etc/rc.d/functions

SERV='/usr/sbin/nanoweb.php'
CONF='/etc/nanoweb/nanoweb.conf'

[ -f /etc/conf.d/nanoweb ] && . /etc/conf.d/nanoweb

SRVBN=$(basename $SERV)
PIDFILE=`grep -i pidfile $CONF |cut -d= -f2 |cut -c2-`

is_running () {
	if [ -f "$PIDFILE" ]; then 
		return 0;
	else 
		return 1;
	fi
}

nw_start () {
	stat_busy "Starting nanoweb"

	if is_running; then
		stat_fail
	else
		$SERV --config=$CONF --start-daemon --quiet

		if [ $? == 0 ]; then
			stat_done
		else
			stat_fail
		fi

	fi
}

nw_stop () {
	stat_busy "Stopping nanoweb"

	if is_running; then
		kill `cat $PIDFILE` >/dev/null 2>/dev/null
		sleep 1
		rm -f $PIDFILE
		stat_done
	else
		stat_fail
	fi
}

case "$1" in
	start)
		nw_start;
	;;

	stop)
		nw_stop;
	;;

	restart)
		nw_stop;
		sleep 1
		nw_start;
	;;

	*)
		echo "usage: $0 {start|stop|restart}"
	;;
esac