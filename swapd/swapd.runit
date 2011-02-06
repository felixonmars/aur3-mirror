#!/bin/bash

# source application-specific settings

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/swapd`
SVC=swapd

if [ -z "$PID" ]
then
        exec /usr/sbin/swapd
else
        [ -z $PID ] || exec watchpid $PID
fi


