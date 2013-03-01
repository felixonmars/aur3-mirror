#!/bin/bash

NOTIFY_CMD=$(which notify-send)
if [ "${NOTIFY_CMD}" ]; then
    NOTIFY_OPTS_DOWN='"-a strongSWAN -i channel-insecure-symbolic -u critical -c "network.disconnected" "Openswan VPN" "NetworkManager just brought down an interface and thus the VPN service."'
    NOTIFY_OPTS_UP='"-a strongSWAN -i channel-secure-symbolic -u normal -c "network.connected" "Openswan VPN" "NetworkManager just brought up an interface and thus the VPN service. Depending on your configuration you might want to start the tunnel"'
fi 


if [ "$(systemctl is-enabled strongswan.service)" == "enabled" ]; then
    case "${2}" in
	up|vpn-up)
	    if [ "${NOTIFY_CMD}" ]; then
		${NOTIFY_CMD} ${NOTIFY_OPTS_DOWN}
	    fi
	    if [ "$(systemctl is-active strongswan.service)" == "active" ]; then
		systemctl restart strongswan.service
	    elif [ "$(systemctl is-active strongswan.service)" == "inactive" ]; then
		systemctl start strongswan.service
	    fi
	;;
	down|vpn-down)
	    if [ "${NOTIFY_CMD}" ]; then
		${NOTIFY_CMD} ${NOTIFY_OPTS_DOWN}
	    fi
	    systemctl stop strongswan.service
	;;
    esac
fi
exit 0
