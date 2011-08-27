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

KERNEL_VER=`uname -r`

case "$1" in
    start)
        stat_busy "Starting Unifiedkernel"
	/sbin/insmod /lib/modules/$KERNEL_VER/kernel/uk/unifiedkernel.ko rootdir=`cat /etc/unifiedkernel/home`/.wine &> /dev/null
	chown `cat /etc/unifiedkernel/user`:`cat /etc/unifiedkernel/user` `cat /etc/unifiedkernel/home` -R
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon unifiedkerneld
		stat_done
	fi
        ;;
    stop)
	stat_busy "Stopping Unifiedkernel"
	/sbin/rmmod unifiedkernel &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon unifiedkerneld
		stat_done
	fi
	;;
    status)
	if [ -e /proc/unifiedkernel/builtin_dll ]; then
		echo $"Unifiedkernel is started."
	else
		echo $"Unifiedkernel is stoped."
	fi
        ;;
    restart)
        $0 stop
	sleep 1
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|status|restart}"
	;;
esac
exit 0
