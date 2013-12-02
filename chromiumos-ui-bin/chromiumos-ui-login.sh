#!/bin/bash

profiledir=$HOME/.config/chromiumos-ui

# Check if user has logged into Chromium OS before
if [[ -d "$profiledir/user" ]]; then
	# Get logged in Chromium OS user
	user=$(sed -nr -e 's/^\s*"LoggedInUsers": \[ "([^"]*)" \],/\1/p' "$profiledir/Local State")
	exec chromiumos-ui --login-profile=user --login-user="$user" "$@"
else
	# Perform first-time login
	exec chromiumos-ui --login-profile=user --login-manager "$@"
fi
