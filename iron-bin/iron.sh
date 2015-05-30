#!/usr/bin/env bash

[[ -f '/etc/iron/default' ]] && . '/etc/iron/default'

LD_LIBRARY_PATH="/usr/lib:/usr/share/iron" /usr/share/iron/iron ${IRON_FLAGS} ${IRON_USER_FLAGS} "$@"
