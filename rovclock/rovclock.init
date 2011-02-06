#!/bin/sh

. /etc/rc.conf
. /etc/rc.d/functions

[ -f /etc/conf.d/rovclock ] && . /etc/conf.d/rovclock

case "$1" in
  start)
    stat_busy "Starting RadeonOverclock"
    _CPU_SPEED=`rovclock -i | tail -n 1 | sed 's/Core: \(.*\) MHz,.*/\1/'`
    _MEM_SPEED=`rovclock -i | tail -n 1 | sed 's/.*, Mem: \(.*\) MHz/\1/'`
    echo 'CPU_FREQ='${_CPU_SPEED} > /var/run/rovclock
    echo 'MEM_FREQ='${_MEM_SPEED}>> /var/run/rovclock
    rovclock -c ${CPU_FREQ} -m ${MEM_FREQ} > /dev/null

    if [ $? -eq 0 ] ; then
	    add_daemon rovclock
	    stat_done
    else
	    stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping RadeonOverclock"
    . /var/run/rovclock
    rovclock -c ${CPU_FREQ} -m ${MEM_FREQ} > /dev/null
    if [ $? -eq 0 ] ; then
	    rm_daemon rovclock
	    stat_done
    else
	    stat_fail
    fi

    ;;
  restart)
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
