#!/bin/sh
if [ -f /etc/chromium-dev/default ] ; then
  . /etc/chromium-dev/default
fi

CHROMIUM_FLAGS=${CHROMIUM_USER_FLAGS:-"$CHROMIUM_FLAGS"}

export CHROME_WRAPPER=/usr/lib/chromium-dev/chromium
export CHROME_DESKTOP=chromium-dev.desktop

exec /usr/lib/chromium-dev/chromium --class=chromium-dev ${CHROMIUM_FLAGS} "$@"