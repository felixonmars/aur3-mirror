#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
JANUS_ARGS=
[ -f /etc/conf.d/janus ] && . /etc/conf.d/janus

case "$1" in
        start)
                stat_busy "Starting IPsec Dynamic DNS Watcher"
                if [ -z "$PID" ]; then 
                        /usr/bin/janus ${JANUS_ARGS}
                        if [ $? -gt 0 ]; then
                                stat_fail
                        else
                                add_daemon janus
                                stat_done
                        fi
                else
                        stat_fail
                fi
        ;;
        stop)
                stat_busy "Stopping IPsec Dynamic DNS Watcher"
                /usr/bin/janus --stop
                if [ $? -gt 0 ]; then
                        stat_fail
                else
                        rm_daemon janus
                        stat_done
                fi
        ;;
        restart)
                stat_busy "Restarting IPsec Dynamic DNS Watcher"
                /usr/bin/janus --restart ${JANUS_ARGS}
                if [ $? -gt 0 ]; then
                        stat_fail
                else
                        stat_done
                fi
        ;;
        *)
                echo "usage: $0 {start|stop|restart}"  
esac
