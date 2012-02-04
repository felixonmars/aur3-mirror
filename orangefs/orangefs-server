#!/bin/sh
# Altered for Archlinux rc system by andrew@lightningtoads.com
#
# description: orangefs-server is the server component of ORANGEFS
#
# chkconfig: 345 35 55

# Source function library.
. /etc/rc.conf
. /etc/rc.d/functions

# Configuration information moved to /etc/conf.d/orangefs-server.conf
[ -f /etc/conf.d/orangefs-server.conf ] && . /etc/conf.d/orangefs-server.conf

# verify presence of server binary
if ! [ -x ${ORANGEFSSERVER} ]; then
	echo "Error: could not find executable ${ORANGEFSSERVER}"
	exit 1
fi

# look for fs conf
if test "x$ORANGEFS_FS_CONF" = x
then
	ORANGEFS_FS_CONF=${ORANGEFS_CONF_PATH}/fs.conf
fi
if ! [ -r ${ORANGEFS_FS_CONF} ]; then
	echo "Error: could not read ${ORANGEFS_FS_CONF}"
	exit 1
fi

# See how we were called.
PID=`cat $ORANGEFS_PIDFILE 2>/dev/null`
case "$1" in
  start)
	stat_busy "Starting ORANGEFS server: "
	[ -z "$PID" ] && ${ORANGEFSSERVER} --pidfile ${ORANGEFS_PIDFILE} ${ORANGEFS_FS_CONF}
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon orangefs-server
		stat_done
	fi
	;;
  stop)
	stat_busy "Stopping ORANGEFS server: "
	[ ! -z "$PID" ]  && kill $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon orangefs-server
		stat_done
	fi
	;;
  status)
        status orangefs-server
	;;
  restart)
	$0 stop
	# give server time to die cleanly
	sleep 2
	$0 start
	;;
  *)
	echo "Usage: $0 {start|stop|status|restart}"
	exit 1
esac

exit 0

