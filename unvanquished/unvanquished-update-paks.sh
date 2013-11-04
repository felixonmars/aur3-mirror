#!/bin/sh

if [ ! $EUID -eq 0 ]; then
	echo "This script updates the Unvanquished main installation and thus must be run as root."
	exit
fi

exec /usr/lib/unvanquished/download-pk3.sh /var/lib/unvanquished/main /var/cache/unvanquished/update-paks
