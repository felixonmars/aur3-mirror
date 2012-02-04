#!/bin/bash

if [ -e "/etc/rc.d/groupvpn" ]; then
	case "$2" in
		up)
			/etc/rc.d/groupvpn restart
		;;
		down)
			/etc/rc.d/groupvpn stop
		;;
	esac
fi
