#!/bin/bash

if [[ "$(uname -m)" == "x86_64" ]];then
    export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}/usr/lib32/skype/skype-poll-fix.so"
else
    export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}/usr/lib/skype/skype-poll-fix.so"
fi

exec skype "$@"

