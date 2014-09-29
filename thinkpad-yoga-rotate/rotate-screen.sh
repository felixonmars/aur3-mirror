#!/bin/bash

# Note: xrandr needs to execute in the context of the X server

# Find the user running the X server
user="$(who -u | grep -F '(:0)' | head -n 1 | awk '{print $1}')"

# A convenience function to run a command in the X server context
with_display() { DISPLAY=:0 su -c "$(printf "%q " "$@")" "$user"; }

# As the same ACPI event is currently emitted for both going in and out
# of the tablet mode, we need to toggle the orientation

# Figure out the current rotation:
current=`with_display xrandr -q --verbose | grep eDP1 | grep -o -E 'left|normal' | head -1`


# Set the next orientation
case $current in
    normal)      next=left;;
    left)        next=normal;;
esac

with_display xrandr -o $next
