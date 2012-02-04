#!/bin/bash

if [ -z "$LANG" ]; then

	if [ -r /etc/profile.d/locale.sh ]; then
		. /etc/profile.d/locale.sh
	fi

	if [ -n "$LANG" ]; then
		export LANG
	fi
fi

exec /usr/share/slim/bin/slim "$@"
