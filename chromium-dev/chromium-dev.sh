#!/bin/sh

# Allow users to override command-line options
# Based on Gentoo's chromium package (and by extension, Debian's)
for f in /etc/chromium-dev/* ; do
   [[ -f ${f} ]] && source "${f}"
done

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromium-dev/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}

export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP="chromium-dev.desktop"

exec /usr/lib/chromium-dev/chromium-dev ${CHROMIUM_FLAGS} "$@"
