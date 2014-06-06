#!/bin/sh

# Get rid of all clients started by Xsetup
xwininfo -root -children | grep '  0x' | cut -d' ' -f6 | xargs -n1 xkill -id

# From the default Xstartup file; 'GiveConsole'
/etc/X11/xdm/GiveConsole
