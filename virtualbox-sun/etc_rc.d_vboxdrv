#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/vboxdrv

case "$1" in
    start)
	stat_busy "Loading modules for VirtualBox"
	for module in "${MODULES[@]}"; do
	    if [ "$module" = "${module#!}" ]; then
		modprobe -q $module >/dev/null 2>&1
		grep -q ^$module /proc/modules
		if [ $? -ne 0 ]; then
		    res=$?; break
		fi
	    fi
	done
	if [ -n "$res" ]; then
	    stat_fail
	    printhl "Try running '$0 setup', of course without quotes"
	else
	    add_daemon vboxdrv
	    stat_done
	fi
	;;
    stop)
	stat_busy "Unloading modules for VirtualBox"
	for module in "${MODULES[@]}"; do
	    if [ "$module" = "${module#!}" ]; then
		REVERSE="$module $REVERSE"
	    fi
	done
	if modprobe -q -r $REVERSE >/dev/null 2>&1; then
	    rm_daemon vboxdrv
	    stat_done
	else
	    stat_fail
	fi
	;;
    restart)
	$0 stop
	$0 start
	;;
    setup)
	if [ -x /etc/rc.d/dkms_autoinstaller ]; then
	    dkms add -m vboxhost -v $VBOX_VERSION >/dev/null 2>&1
	    exec /etc/rc.d/dkms_autoinstaller start
	else
	    stat_busy "Building/installing vbox modules for `uname -srm`"
	    . /etc/vbox.cfg
	    cd "/usr/src/vboxhost-$VBOX_VERSION"
	    SETUP_LOG='/var/log/vboxdrv-setup.log'
	    make >${SETUP_LOG} 2>&1 && make install >>${SETUP_LOG} 2>&1; RET=$?; make clean >/dev/null 2>&1
	    if [ "$RET" -eq 0 ]; then
		stat_done
	    else
		stat_fail
		printhl "See '${SETUP_LOG}' for further details"
	    fi
	fi
	;;
    *)
	echo "usage: $0 {start|stop|restart|setup}"
esac
# vim:set ts=4 sw=4 et:
