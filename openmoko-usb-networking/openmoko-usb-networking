#!/bin/sh

if [ "$ACTION" == "add" ]
then
    ACTION=start
fi

if [ "$ACTION" == "remove" ]
then
    ACTION=stop
fi

INTERFACE=${INTERFACE:-"eth1"}
ACTION=${ACTION:-"$1"}

case "$ACTION" in
    start)
        logger -t openmoko "Connected, setting up network"
	/usr/sbin/iptables -A POSTROUTING -t nat -j MASQUERADE -s 192.168.0.0/24
	if [ "$(cat /proc/sys/net/ipv4/ip_forward)" = "0" ]; then
                echo "temoprarely allow ip_forward for openmoko" > /var/run/openmoko.ip_forward
                echo 1 > /proc/sys/net/ipv4/ip_forward
        fi
	/sbin/ifconfig eth1 192.168.0.200 netmask 255.255.255.0
        ;;
    stop)
        logger -t openmoko "Disconnected, bringing down network"
	if [ -f /var/run/openmoko.ip_forward ]; then
                rm /var/run/openmoko.ip_forward
                echo 0 > /proc/sys/net/ipv4/ip_forward
        fi
	/usr/sbin/iptables -t nat -F POSTROUTING
        /sbin/ifconfig eth1 down
        ;;
esac

