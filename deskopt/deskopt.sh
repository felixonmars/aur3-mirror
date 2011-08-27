#! /bin/sh

. /etc/rc.conf
. /etc/rc.d/functions

deskopt_start() {
deskopt -c /etc/deskopt.conf || return 1
}

deskopt_stop() {
deskopt -q
sleep 1s
if [ $? -gt 0 ]; then
	kill -9 $PID &> /dev/null || return 1
fi
}

case $1 in
    start)
    	stat_busy "Starting DeskOpt"
	deskopt_start
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon deskoptd
		stat_done
	fi
	;;
    stop)
    	stat_busy "Stopping DeskOpt"
	deskopt_stop
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon deskoptd
		stat_done
	fi
	;;
    restart)
	$0 stop
	$0 start
	;;
    *)
	echo "Usage: $0 {start|stop|restart}"
	;;
esac
