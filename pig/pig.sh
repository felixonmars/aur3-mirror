#!/bin/sh

for f in /etc/profile.d/*.sh
do
    . $f
done

/usr/share/java/pig/bin/pig "$@"
