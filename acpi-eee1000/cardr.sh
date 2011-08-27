#!/bin/bash

source /etc/acpi/eee.conf

CARDR="/proc/acpi/asus/cardr"
STATE=$(cat $CARDR)

case $STATE in
	0)	echo 1 > $CARDR ;;
	1)	echo 0 > $CARDR ;;
esac

exit 0
