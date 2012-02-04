#!/bin/bash

if [ "$(id -u)" != 0 ]
then
	echo "You must be root to start aMuleD"
	exit 2
fi

# general config
USECOLOR="YES"
. /etc/conf.d/amule.conf
. /etc/rc.d/functions

if [ -z $AMULEUSER ]
then
	echo "Unable to run aMuleD. You must set the user in /etc/conf.d/amule.conf."
	exit 2
elif [[ $AMULEUSER == "root" ]]
then
	echo "Unable to run aMuleD. You must not run aMule as root, EVER!"
	exit 2
fi

confdir=$(su -l $AMULEUSER -c "echo ~")/.aMule
logfile=$(su -l $AMULEUSER -c "echo ~")/.aMule/amuled.log
lockfile=$(su -l $AMULEUSER -c "echo ~")/.aMule/muleLock

PID=`pidof -o %PPID /usr/bin/amuled`

[ -f $logfile ] && rm -f $logfile

case "$1" in
    start)
        stat_busy "Starting aMuleD SVN..."
	
	if [ -f $lockfile ]
	then
		stat_fail
		echo "Unable to run aMuleD, it is already running. If you're sure aMuleD is not already running, you can remove ${lockfile}."
		exit 2
	fi
	
	[ ! -d $confdir ] && su -l $AMULEUSER  -c "mkdir -p $confdir"
	[ -z "$PID" ] && su -l $AMULEUSER -c "/usr/bin/amuled -o &> $logfile &"

	
	i=0

	while [ "$i" -lt 20 ]
	do
		if [ ! -z "$(grep "No other instances are running." $logfile)" ]
		then
			add_daemon amule
			stat_done
			exit 0
		elif [ ! -z "$(grep "There seems to be an instance of aMule already running" $logfile)" ]
		then
			stat_fail
			exit 2
		else
			i="$(($i+1))"
		fi
	sleep 1
	done
	stat_done
        ;;
    stop)
        stat_busy "Stopping aMuleD SVN..."
	if [ -f $lockfile ]
	then
	
		[ ! -z "$PID" ]  && kill $PID &> /dev/null
	else
		stat_fail
		echo "Unable to stop aMuleD. It is not running."
		exit 2
	fi
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon amule
            stat_done
        fi
	sleep 10
        ;;
    restart)
        $0 stop
	sleep 1
        $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
	;;
esac
exit 0
