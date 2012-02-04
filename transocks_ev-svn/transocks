#!/bin/bash

. /etc/rc.conf
. /etc/conf.d/transocks
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Enabling transocks"
    /usr/bin/transocks_ev -p $TRANSOCKS_PORT -s $SOCKS_PORT -S $SOCKS_HOST

    # Create chain
    $IPTABLES -t nat -N transocks

    # Do not redirect traffic for the SOCKS-Server
    $IPTABLES -t nat -I transocks -p tcp -d $SOCKS_HOST --dport $SOCKS_PORT -j RETURN

    # Do not redirect local network
    $IPTABLES -t nat -I transocks -o lo -j RETURN
    for ip in $LOCAL_IPS; do
        $IPTABLES -t nat -I transocks -d $ip -j RETURN
    done

    # Enable Logging
    if [ "${ENABLE_LOGGING}" == "y" ]; then
      $IPTABLES -t nat -A transocks -p tcp -j LOG --syn --log-level info --log-prefix "SOCKSify "
    fi
    # Redirect all traffic that gets to the end of our chain
    $IPTABLES -t nat -A transocks -p tcp -j REDIRECT --to-port $TRANSOCKS_PORT

    # Filter all traffic from this computer
    $IPTABLES -t nat -A OUTPUT -j transocks

    # Filter all traffic that is routed over this host
    if [ "${ENABLE_ROUTING}" == "y" ]; then
      $IPTABLES -t nat -A PREROUTING -j transocks
    fi
    stat_done
    add_daemon transocks
    ;;
  stop)
    stat_busy "Disabling transocks"
    /usr/bin/killall transocks_ev
    $IPTABLES -t nat -D OUTPUT -j transocks
    if [ "${ENABLE_ROUTING}" == "y" ]; then
      $IPTABLES -t nat -D PREROUTING -j transocks
    fi
    $IPTABLES -t nat -F transocks
    $IPTABLES -t nat -X transocks
    rm_daemon transocks
    stat_done
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
    ;;
esac
exit 0
