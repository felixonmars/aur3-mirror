#!/bin/sh

matchbox-window-manager -use_titlebar no &
chromiumos-ui-login --session
sleep 1
exec pkill -9 -f chromiumos-ui/chrome
