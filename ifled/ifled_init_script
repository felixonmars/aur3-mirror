#!/bin/sh
# vim:ts=4:sw=4:et:
#
# Script to take care of ifled initialization on each led as defined
# in /etc/ifled.conf
#
# Taken from Mandriva and modified for ArchLinux by Gilles CHAUVIN <gcnweb@gmail.com>
#

. /etc/rc.conf
. /etc/rc.d/functions

CONFIG="/etc/sysconfig/ifled"

# Check if config file is present
if [ -f ${CONFIG} ]; then
    . ${CONFIG}
else
    echo "File ${CONFIG} is missing. Aborting!"
    exit 1
fi

PID=`pidof -o %PPID /usr/sbin/ifled`

case "$1" in
    start) 
        if [ ! -z "$IF1" ] && /sbin/ifconfig | grep -q "$IF1" ; then
            stat_busy "Starting InterfaceLED (\"$IF1\" on NumLock)" 
            [ -z "$PID" ] && /usr/sbin/ifled console "$IF1" -f -c ann
            if [ $? -gt 0 ]; then
                stat_fail
            else
                add_daemon ifled
                stat_done
            fi
        fi

        if [ ! -z "$IF2" ] && /sbin/ifconfig | grep -q "$IF2" ; then
            stat_busy "Starting InterfaceLED (\"$IF2\" on CapsLock)"
            [ -z "$PID" ] && /usr/sbin/ifled console "$IF2" -f -c nan
            if [ $? -gt 0 ]; then
                stat_fail
            else
                add_daemon ifled
                stat_done
            fi
        fi

        if [ ! -z "$IF3" ] && /sbin/ifconfig | grep -q "$IF3" ; then
            stat_busy "Starting InterfaceLED (\"$IF3\" on ScrollLock)"
            [ -z "$PID" ] && /usr/sbin/ifled console "$IF3" -f -c nna
            if [ $? -gt 0 ]; then
                stat_fail
            else
                add_daemon ifled
                stat_done
            fi
        fi
    ;;


    stop)
        stat_busy "Stopping InterfaceLED"
        [ ! -z "$PID" ]  && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon ifled
            stat_done
        fi
    ;;


    restart)
        $0 stop
        $0 start
    ;;
    

    *)
        echo "usage: $0 {start|stop|restart}" >&2
        exit 1
    ;;

esac

exit 0
