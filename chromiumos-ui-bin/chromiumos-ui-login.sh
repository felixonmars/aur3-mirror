#!/bin/bash

profiledir=$HOME/.config/chromiumos-ui

# Use login manager if not started as a display manager session
loginmanager=yes
if [[ "$1" == "--session" ]]; then
	shift
	# Check if user has ever logged into Google account before
	if [[ -d "$profiledir/user" ]]; then
		# Get last logged in user
		user=$(sed -nr -e 's/^\s*"LastLoggedInRegularUser": "([^"]*)",/\1/p' "$profiledir/Local State")
		# Check for stub user
		if [[ -z "$user" || "$user" == "stub-user@example.com" ]]; then
			# Use login manager instead
			user=
		else
			loginmanager=
		fi
	fi
fi

exec chromiumos-ui \
	--login-profile=user \
	${loginmanager:+--login-manager} \
	${user:+--login-user=}$user "$@"
