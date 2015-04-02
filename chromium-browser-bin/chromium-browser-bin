#!/bin/bash

# Allow users to override command-line options
# Based on Gentoo's chromium package
if [[ -f /etc/chromium-browser-bin/default ]]; then
        . /etc/chromium-browser-bin/default
fi
# Source additional configuration files
for file in /etc/chromium-browser-bin/*; do
        # Don't source /etc/chromium-browser-bin/default again
        [[ $file == /etc/chromium-browser-bin/default ]] && continue

        if [[ -f $file ]]; then
                . $file
        fi
done

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromium-browser-bin/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}

export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP=chromium-browser-bin.desktop

exec /opt/chromium-browser-bin/chrome $CHROMIUM_FLAGS "$@"