#!/bin/bash

# Get username of the currently logged in user
username=$(who | cut -d' ' -f1 | sort | uniq)
status=$(nmcli n connectivity check)

if [ "$status" = "full" ]; then
	systemctl restart insync@"${username}"
elif [ "$status" = "portal" ]; then
	systemctl restart insync@"${username}"
else
	systemctl stop insync@"${username}"
fi
