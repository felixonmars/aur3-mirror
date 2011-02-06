#!/bin/bash
# Executed on power button press

POWER_BUTTON_COMMAND="/usr/bin/xfce4-session-logout"

source /etc/acpi/eee.conf

$POWER_BUTTON_COMMAND &

exit 0
