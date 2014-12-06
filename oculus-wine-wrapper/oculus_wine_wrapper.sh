#!/bin/sh

mydir=/usr/share/oculus-wine-wrapper

[ -z "$WINE" ] && WINE=wine

if [ $# -lt 1 ]; then
    echo "Usage: $0 [path to game] [arguments]"
    exit 1
fi

OCULUSD=/usr/bin/oculusd
if [ ! -x $OCULUSD ]; then
    echo "Cannot run $OCULUSD"
    exit 1
fi

LD_PRELOAD=$mydir/no_xselectinput.so $OCULUSD & oculus_pid=$!
sleep .5
if ! kill -0 $oculus_pid 2>/dev/null; then
    echo "oculus service exited prematurely: is another instance already running?"
    exit 1
fi
while [ ! -e /dev/shm/OVR* ]; do
    if ! kill -0 $oculus_pid $ 2>/dev/null; then
        wait
        echo "oculusd exited without creating SHM"
        exit 1
    fi
    sleep .1
done
$WINE $mydir/oculus_shm_adapter.exe & wine_pid=$!
sleep .1

$WINE "$@"
echo
echo "Game exited, stopping service..."
echo
kill $wine_pid
kill $oculus_pid
wait
