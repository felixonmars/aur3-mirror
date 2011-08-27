#!/bin/sh

Pgm=`/usr/bin/basename $0`
RELAYD_BIN=/usr/sbin/relayd

. /etc/rc.conf
. /etc/rc.d/functions

case $1 in

    'start')

	# make sure the executable exists.

	if [ ! -f $RELAYD_BIN ]; then
	    /bin/echo "$Pgm: $RELAYD_BIN does not exist.  Not starting Relayd" 1>&2
	    stat_fail
	    exit 1
	fi

	/bin/echo "$Pgm: Starting Relayd." 1>&2

	$RELAYD_BIN &
	stat_done
	;;



    'stop')

	/bin/echo "$Pgm: Shutting down Relayd." 1>&2
        stat_done
	pkill -x relayd

	;;


    *)
	/bin/echo "usage: $Pgm {start|stop}" 1>&2

	exit 0

	;;

esac
