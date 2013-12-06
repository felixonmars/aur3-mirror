#!/bin/sh

matchbox-window-manager -use_titlebar no &

chromiumos-ui "$@"

# Wait for remaining processes to exit
for i in 1 2 3; do
	# Check if any processes remain
	if ! pgrep -f chromiumos-ui/chrome > /dev/null; then
		exit 0
	fi
	sleep 1
done

# Kill any remaining processes
exec pkill -9 -f chromiumos-ui/chrome
