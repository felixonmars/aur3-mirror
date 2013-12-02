#!/bin/bash

# Allow users to override command-line options
# Based on Gentoo's chromium package (and by extension, Debian's)
if [[ -f /etc/chromiumos-ui/default ]]; then
	. /etc/chromiumos-ui/default
fi

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromiumos-ui/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}

export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP=chromiumos-ui.desktop

exec /usr/lib/chromiumos-ui/chrome $CHROMIUM_FLAGS --user-data-dir=$HOME/.config/chromiumos-ui "$@"
