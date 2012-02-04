#!/bin/bash
# This file is executed once sleep-button (Fn-F1) is pressed.

# Default action:
SUSPEND_COMMAND="/etc/acpi/suspend2ram.sh"

# Possible override
source /etc/acpi/eee.conf

($SUSPEND_COMMAND &)

exit 0
