#!/bin/bash
# Executed on power button press

POWER_BUTTON_COMMAND="/sbin/shutdown -t3 -h now"

source /etc/acpi/eee.conf

$POWER_BUTTON_COMMAND &

exit 0
