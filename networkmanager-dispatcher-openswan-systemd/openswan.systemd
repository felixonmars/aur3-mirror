#!/bin/bash

if [ "$(systemctl is-enabled openswan.service)" == "enabled" ]; then
    case "${2}" in
	up|vpn-up)
	    if [ "$(systemctl is-active openswan.service)" == "active" ]; then
		systemctl restart openswan.service
	    elif [ "$(systemctl is-active openswan.service)" == "inactive" ]; then
		systemctl start openswan.service
	    fi
	;;
	down|vpn-down)
	    systemctl stop openswan.service
	;;
    esac
fi
exit 0
