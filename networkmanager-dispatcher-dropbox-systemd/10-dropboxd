#!/bin/bash

# Get username of the currently logged in user
username=$(who | cut -d' ' -f1 | sort | uniq)

case "$2" in
        up)
			
			systemctl restart dropbox@$username
        ;;
        down)
			systemctl stop dropbox@$username
        ;;
esac