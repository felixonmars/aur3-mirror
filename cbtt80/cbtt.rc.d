#!/bin/bash

# Start/stop/restart script for CBTT, the C++ BitTorrent tracker
# Unfortunately, since the tracker's binary itself is written to output
# data to terminal by default (and there's no known way to override this,
# at least to me), we have to use dtach, what results in some quite
# unnecessary checking whether the server is actually running or not.
# If somebody has a better idea on how to do this, please contact me.

. /etc/rc.d/functions

case "$1" in
    start)
	stat_busy "Starting CBTT"
	if [ -e /home/tracker/bnbtconsole ];
	then
	    rm -f /home/tracker/bnbtconsole
	fi
	if [ ! -z `pidof bnbt` ];
	then
	    stat_fail
	else
	    su - -c "dtach -n bnbtconsole /home/tracker/bnbt" tracker
	    if [ -z `pidof bnbt` ];
	    then
		stat_fail
	    else
		add_daemon cbtt
		stat_done
	    fi
	fi
	;;
    stop)
	stat_busy "Stopping CBTT"
	if [ -z `pidof bnbt` ];
	then
	    stat_fail
	else
	    kill `pidof bnbt`
	    rm_daemon cbtt
	    stat_done
	fi
	;;
    restart)
	$0 stop
	$0 start
	;;
    *)
	echo "Usage : $0 {start|stop|restart}"
	;;
esac
