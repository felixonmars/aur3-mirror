#!/bin/sh
if [ "`id -u`" != "0" ]; then
    echo "ERROR: You must be root"
    exit 1
fi
if [ "$1" == "" ]; then
    echo "USAGE: $0 <service> [action]"
    exit 1
fi
service=$1
shift
if [ ! -f /etc/rc.d/$service ]; then
    echo "ERROR: No such service"
    exit 1
fi

/etc/rc.d/$service $*
