#!/bin/bash

profiledir=$HOME/.config/chromiumos-ui

# Use login manager if not started as a display manager session
if [[ "$1" == "--session" ]]; then
	shift
else
	loginmanager=yes
fi

# Check if user has logged into Chromium OS before
if [[ -d "$profiledir/user" ]]; then
	# Get logged in Chromium OS user
	user=$(sed -nr -e 's/^\s*"LoggedInUsers": \[ "([^"]*)" \],/\1/p' "$profiledir/Local State")
else
	# Always use login manager
	loginmanager=yes
fi

exec chromiumos-ui \
	--login-profile=user \
	${loginmanager:+--login-manager} \
	${user:+--login-user=}$user "$@"
