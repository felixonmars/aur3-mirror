#!/bin/sh

if command -v screen &>/dev/null 2>&1
then
    screen -d -m mono /usr/lib/rainy/Rainy.exe -c /etc/rainy.conf -b
else
    echo "Install screen to run in daemon mode"
fi

