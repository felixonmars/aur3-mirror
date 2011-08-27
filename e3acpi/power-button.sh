#!/bin/bash
# Executed on power button press

POWER_BUTTON_COMMAND="/sbin/shutdown -t3 -h now"

source /etc/acpi/eee.conf

$POWER_BUTTON_COMMAND &

# Well create power.lock, if it does not yet exist. this will disable suspend2ram.sh and it will be re-enabled once eee-initscript is run.
touch /etc/acpi/power.lock

exit 0
