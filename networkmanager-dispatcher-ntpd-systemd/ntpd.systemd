#!/bin/bash

if [ "$(systemctl is-enabled ntpd.service)" == "enabled" ]; then
	case "${2}" in
		up|vpn-up)
			systemctl start ntpd.service
		;;
		down|vpn-down)
			systemctl stop ntpd.service
		;;
	esac
fi
