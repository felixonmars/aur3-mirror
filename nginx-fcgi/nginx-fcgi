#!/bin/sh
#
# nginx-fcgi
#
# description:	nginx-fcgi is a perl script to provide simple cgi support for nginx http daemon
# processname:	nginx-fcgi
# pidfile:	/var/run/nginx-fcgi.pid
# config:	/etc/conf.d/nginx-fcgi.conf


. /etc/rc.conf
. /etc/rc.d/functions

DAEMON="/usr/bin/nginx-fcgi"

# Get service config
if [ ! -f /etc/conf.d/nginx-fcgi.conf ]; then
	echo >&2 "nginx-fcgi: Missing /etc/conf.d/nginx-fcgi.conf config file"
	exit 1
fi
. /etc/conf.d/nginx-fcgi.conf
if [ -s $SPAWN_PID ]; then
	PID=$(cat $SPAWN_PID)
fi

checkconfig() {

	if [ -z "$SPAWN_UID" ]; then
		echo >&2 "nginx-fcgi: Missing SPAWN_UID value (user name)"
		exit 1
	fi

	if [ -z $SPAWN_GID ]; then
		echo >&2 "nginx-fcgi: Missing SPAWN_GID value (group name)"
		exit 1
	fi

	if [ -n "$SPAWN_PORT" -a -n "$SPAWN_SOCKET" ]; then
		echo >&2 "nginx-fcgi: port and socket can not be used simulatenously"
		exit 1
	fi

	if [ -n "$SPAWN_ADDR" -a -z "$SPAWN_PORT" ]; then
		 echo >&2 "nginx-fcgi: bind address specified but no port"
		 exit 1
	fi

	if [ -z "$SPAWN_LOG" ]; then
		echo >&2 "nginx-fcgi: missing declaration of log file"
		exit 1
	fi

	USER_ID=`id -u $SPAWN_UID 2>&1 > /dev/null`
	if [ $USER_ID -eq $USER_ID > /dev/null 2>&1 ]; then
		USER_ID=`id -u $SPAWN_UID`
	else
		echo >&2 "nginx-fcgi: $SPAWN_UID user not found in system"
		exit 1
	fi

	USER_GID=`id -g $SPAWN_GID 2>&1 > /dev/null`
	if [ -z "$USER_GID" ]; then
		USER_GID=`id -g $SPAWN_GID`
	else
		echo >&2 "nginx-fcgi: $SPAWN_UID group not found in system"
		exit 1;
	fi
}

start() {
	if [ ! -s $SPAWN_PID ]; then
		stat_busy "Starting nginx-fcgi"
		#su $SPAWN_UID -c "$DAEMON -S $SPAWN_SOCKET -l $SPAWN_LOG -pid $SPAWN_PID \"$SPAWN_OPT\""
		sudo -u $SPAWN_UID $DAEMON -S $SPAWN_SOCKET -l $SPAWN_LOG -pid $SPAWN_PID $SPAWN_OPT
		if [ $? -eq 0 ]; then
			add_daemon nginx-fcgi
			stat_done
		else
			stat_fail
		fi
	else
		stat_busy "nginx-fcgi is running"
	fi
}

stop() {
	if [ -s $SPAWN_PID ]; then
		stat_busy "Stopping nginx-fcgi"
		kill $(<$SPAWN_PID)
		if [ $? -eq 0 ]; then
			rm -f $SPAWN_PID
			rm -f $SPAWN_SOCKET
			rm_daemon nginx-fcgi
			stat_done
		else
			stat_fail
		fi
	else
		stat_busy "nginx-fcgi is not running"
	fi
}

status() {
	if [ -s $SPAWN_PID ]; then
        echo "nginx-fcgi running"
    else
        echo "nginx-fcgi not running"
    fi
}

RETVAL=0

case "$1" in
  start)
  	checkconfig
  	start
	;;
  stop)
  	stop
	;;
  status)
	status nginx-fcgi
	RETVAL=$?
	;;
  restart)
	stop
	start
	;;
  *)
	msg_usage "$0 {start|stop|restart|status}"
	exit 3
	;;
esac

exit $RETVAL
