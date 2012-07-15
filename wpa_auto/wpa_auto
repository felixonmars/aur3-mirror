#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/wpa_auto

DAEMON_NAME=wpa_auto
WPA_SUPPLICANT=/usr/sbin/wpa_supplicant
WPA_CLI=/usr/sbin/wpa_cli
IFCONFIG=/sbin/ifconfig
IP=/usr/sbin/ip
DHCPCD=/sbin/dhcpcd
ACTION_SCRIPT=/usr/bin/wpa_auto_action

case "$1" in
    start)
        stat_busy "Starting $DAEMON_NAME daemon"
        if [[ ! -f /run/daemons/$DAEMON_NAME ]]; then
            $IP link set $INTERFACE up &&\
            $WPA_SUPPLICANT -D$WPA_DRIVER -i$INTERFACE -c$WPA_CONFIG $WPA_OPTIONS -B &&\
            $WPA_CLI -i$INTERFACE -a$ACTION_SCRIPT $WPA_CLI_OPTIONS -B
            if [[ $? -gt 0 ]]; then
                stat_fail
                exit 1
            else
                add_daemon $DAEMON_NAME
                stat_done
            fi
        else
            stat_fail
            exit 1
        fi
        ;;
    stop)
        stat_busy "Stopping $DAEMON_NAME daemon"
        if [[ -f /run/daemons/$DAEMON_NAME ]]; then
            rm_daemon $DAEMON_NAME
            $DHCPCD -qx $INTERFACE &>/dev/null
            $WPA_CLI -i$INTERFACE terminate &>/dev/null &&\
            $IP link set $INTERFACE down
            if [[ $? -gt 0 ]]; then
                stat_fail
                exit 1
            else
                stat_done
            fi
        else
            stat_fail
            exit 1
        fi
        ;;
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    reset)
        stat_busy "Reseting $DAEMON_NAME daemon"
        if [[ -f /run/daemons/$DAEMON_NAME ]]; then
            $WPA_CLI -i$INTERFACE reassociate &>/dev/null
            if [[ $? -gt 0 ]]; then
                stat_fail
                exit 1
            else
                stat_done
            fi
        else
            stat_fail
            exit 1
        fi
        ;;
        *)
        echo "usage: $0 {start|stop|restart|reset}"
        ;;
esac

exit 0

