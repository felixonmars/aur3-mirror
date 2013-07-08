#!/bin/bash
#
# Generate a default BitTorrent Sync config file for the current user.
# The config file is written to standard out.

btsync --dump-sample-config | sed 's:/home/user/\.sync:'$HOME'/.config/btsync:g' \
	| sed 's:My Sync Device:'$(hostname)':' \
	| sed 's/"login" : "admin"/"login" : "'$USER'"/g'
