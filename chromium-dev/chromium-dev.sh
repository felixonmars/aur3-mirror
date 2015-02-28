#!/bin/sh

# Allow users to override command-line options
# Based on Gentoo's chromium package
# Source additional configuration files
if [[ -f /etc/chromium-dev/default ]]; then
  . /etc/chromium-dev/default
fi
# Source additional configuration files
for file in /etc/chromium-dev/*; do
  # Don't source /etc/chromium-dev/default again
  [[ $file == /etc/chromium-dev/default ]] && continue

  if [[ -f $file ]]; then
  . $file
  fi
done

# Prefer user defined CHROMIUM_USER_FLAGS (from env) over system
# default CHROMIUM_FLAGS (from /etc/chromium-dev/default)
CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-$CHROMIUM_FLAGS}

export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP="chromium-dev.desktop"

exec /usr/lib/chromium-dev/chromium-dev ${CHROMIUM_FLAGS} "$@"
