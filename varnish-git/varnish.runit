#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

. /etc/varnish.conf

BIN="/usr/sbin/varnishd"

PID=`pidof %PPID $BIN`

killjobs () {
	kill $PID >&/dev/null
}

trap killjobs INT QUIT TERM EXIT KILL HUP 

if [ -z "$PID" ]
then
        $BIN $OPTS
else
	for P in $PID
	do 
        	watchpid $P &
	done
fi
wait
