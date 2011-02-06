#!/bin/sh

# A simple script to facilitate the use of the OSS compatibility library.

if [ -d /proc/asound ]; then
    if [ x"$LD_PRELOAD" = x ] ; then
        LD_PRELOAD="libaoss.so.0"
    else
        LD_PRELOAD="$LD_PRELOAD libaoss.so.0"
    fi

    export LD_PRELOAD

    exec "/usr/bin/TeamSpeak"
else
    exec "/usr/bin/TeamSpeak"
fi
exit 1
