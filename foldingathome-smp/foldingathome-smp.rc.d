#!/bin/bash
#/etc/rc.d/foldingathome-smp
#
# Starts the Folding@Home-SMP client in the background

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/foldingathome-smp

PID=`pidof -o %PPID /opt/fah-smp/fah6`
case "$1" in
    start)
    stat_busy "Starting Folding@Home-SMP"
    if [ -z "$PID" ]; then
        if [ ! -z "$FAH_USER" ] ; then
            if [ ! -d "/opt/fah-smp/$FAH_USER" ] ; then
                mkdir /opt/fah-smp/$FAH_USER
				if [ -f /opt/fah-smp/client.cfg ] ; then
					cp /opt/fah-smp/client.cfg "/opt/fah-smp/$FAH_USER/client.cfg"
				fi
                chown -R $FAH_USER /opt/fah-smp/$FAH_USER
                if [ ! -z "$FAH_GRP" ] ; then
                    chgrp -R $FAH_GRP /opt/fah-smp/$FAH_USER
                else
                    chgrp -R users /opt/fah-smp/$FAH_USER
                fi
            fi
            cd /opt/fah-smp/$FAH_USER
            su $FAH_USER -c "/opt/fah-smp/fah6 -smp $FAH_CLIENT_FLAGS &> /opt/fah-smp/$FAH_USER/myfah.log" &
        else
            cd /opt/fah-smp
            /opt/fah-smp/fah6 -smp $FAH_CLIENT_FLAGS &> /opt/fah-smp/myfah.log &
        fi
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
        stat_fail
    else
        add_daemon foldingathome-smp
        stat_done
    fi
    ;;
    
    stop)
    stat_busy "Stopping Folding@Home-SMP"
    [ ! -z "$PID" ]&& kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
        stat_fail
    else
        rm_daemon foldingathome-smp
        stat_done
    fi
    ;;
    
    restart)
    $0 stop
    sleep 1
    $0 start
    ;;
    
    *)
    echo $"Usage: $0 {start|stop|restart}"
esac
