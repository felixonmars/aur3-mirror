#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions

pname=plone

case $1 in

    start)
        stat_busy "Starting Plone"
        cmdline="sudo -u plone /opt/Plone/zeocluster/bin/plonectl start"

        eval $cmdline
        if ck_daemon plone; then
            stat_done
            add_daemon plone 
        else 
            stat_fail
        fi                
    ;;
    
    stop)
        stat_busy "Stopping Plone"
        cmdline="sudo -u plone /opt/Plone/zeocluster/bin/plonectl stop"

        eval $cmdline
        if ck_daemon plone; then
            stat_fail         
        else
            stat_done  
            rm_daemon plone           
        fi
    ;;
    
    restart)
        /etc/rc.d/plone stop
        /etc/rc.d/plone start
    ;;
    
    status)
        cmdline="sudo -u plone /opt/Plone/zeocluster/bin/plonectl status"
        eval $cmdline 
    ;;
    
    *)
        echo "usage: $0 {start|stop|restart|status}"
                  
esac

