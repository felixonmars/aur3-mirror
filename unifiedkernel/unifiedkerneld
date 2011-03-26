#!/bin/sh
#
# wine	Allow users to run Windows(tm) applications by just clicking on them
#	(or typing ./file.exe)
#
# chkconfig: 35 98 10
# description: Allow users to run Windows(tm) applications by just clicking \
#	       on them (or typing ./file.exe)

. /etc/rc.conf
. /etc/rc.d/functions

RETVAL=0

KERNEL_VER=`uname -r`

start() {
	stat_busy "Start Unifiedkernel"
	/sbin/insmod /lib/modules/$KERNEL_VER/kernel/unifiedkernel/unifiedkernel.ko rootdir=`cat /etc/unifiedkernel/home`/.wine > /dev/null 2>&1 && \
#	if /sbin/start-stop-daemon --start --quiet --oknodo --exec /usr/sbin/unifiedkerneld -- start; then
                log_end_msg 0 || \
#        else
                log_end_msg 1
#        fi
	chown `cat /etc/unifiedkernel/user`:`cat /etc/unifiedkernel/user` `cat /etc/unifiedkernel/home`/.wine -R
	stat_done
}

stop() {
	stat_busy "Stop Unifiedkernel"
	/sbin/rmmod unifiedkernel &> /dev/null 2>&1 && \
#	if /sbin/start-stop-daemon --start --quiet --oknodo --exec /usr/sbin/unifiedkerneld -- stop; then
		log_end_msg 0 || \
#	else
		log_end_msg 1
#	fi
	stat_done
}

reload() {
	stop
	start
}

uk_status() {
	if [ -e /proc/unifiedkernel/builtin_dll ]; then
		echo $"Unifiedkernel are started."
		return 0
	else
		echo $"Unifiedkernel art stoped."
		return 3
	fi
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	status)
		uk_status
		RETVAL=$?
		;;
	restart)
		stop
		start
		;;
	condrestart)
		if [ -e /proc/unifiedkernel/builtin_dll ]; then
			stop
			start
		fi
		;;
	*)
		echo $"Usage: $prog {start|stop|status|restart|condrestart}"
		exit 1
esac
exit $RETVAL

