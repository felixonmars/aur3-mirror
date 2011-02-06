#!/bin/sh

exec 2>&1

# general config
. /etc/rc.conf
. /etc/rc.d/functions

BIN=/sbin/in.imapproxyd
SVC=imapproxy

PID=`pidof $BIN`
if [ -z "$PID" ]
then
        if [ -f /var/run/$SVC.pid ]
        then
                rm /var/run/$SVC.pid
                rm_daemon imapproxy
        fi
        $BIN
else
        [ -z $PID ] || exec watchpid $PID
fi
