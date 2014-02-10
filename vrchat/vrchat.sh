#!/bin/sh
cd /opt/vrchat
if [[ $(uname -m) == x86_64 ]]; then
    exec ./VRChat.x86_64 $@
else
    exec ./VRChat.x86 $@
fi
