#!/bin/sh

# I modified the net-profiles script and add auto detect function.
# author: Hubert Star (hubertstar@gmail.com)
# USAGE: netcfg-auto.sh {start|stop|restart}

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
    start)
        stat_busy  "Starting Network Auto Detect:"
        echo -n "   checking  "
        if ! ck_daemon netcfg-auto; then
            echo "netcfg-auto has already been started.  Try '/etc/rc.d/net-auto restart'"
            exit
        fi

        # Ensure any device renaming has occurred as intended
        for daemon in "${DAEMONS[@]}"; do
            if [ "$daemon" = "${daemon#!}" -a "$daemon" = "net-rename" ]; then
                if ck_daemon net-rename; then
                    /etc/rc.d/net-rename start
                fi
          fi
        done

        # $NET env var is passed from the kernel boot line
        [ ! "$NETWORKS_MENU_TIMEOUT" ] && NETWORKS_MENU_TIMEOUT=5 
        
        if [[ "$NET" = "menu" ]]; then
                /usr/bin/netcfg-menu $NETWORKS_MENU_TIMEOUT
        elif [[ "$NET" ]]; then
                /usr/bin/netcfg2 -c $NET
        else 
            # No NET= passed at boot, go to NETWORKS=()
            for network in ${NETWORKS[@]}; do
                echo -n "."
                case $network in
                    menu) # Pull up menu of networks
                        /usr/bin/netcfg-menu $NETWORKS_MENU_TIMEOUT
                        break
                        ;;
                    *) # Either interface or profile
                        if [ "$network" = "${network#!}" ]; then # otherwise profile
                            /usr/bin/netcfg2 $network &>/dev/null
                            # Waiting for NETWORK READY, TODO: for better check network.
                            sleep $NETWORKS_MENU_TIMEOUT
                            GATEWAY=`route  -n | grep '^0.0.0.0' | awk '{print $2}'`
                            ping -c 1 -w 1 $GATEWAY &>/dev/null
                            if [ $? == 0 ]; then
                                echo -n " ready: "
                                echo -en "\033[1m${network}\033[0m"
                                stat_done
                                break
                            fi
                        fi
                        ;;
                esac
            done
        fi       
        add_daemon netcfg-auto
        ;;
    stop)
        # shutdown any profiles started by netcfg (or from NET_PROFILES in rc.conf)
        /usr/bin/netcfg2 -a
        rm_daemon netcfg-auto
        ;;
    restart)
        $0 stop; sleep 1; $0 start
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"  
esac
