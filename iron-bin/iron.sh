#!/bin/bash
[[ -f '/etc/iron/default' ]] && . '/etc/iron/default'

LD_LIBRARY_PATH="/usr/lib:/opt/iron" /opt/iron/iron ${IRON_FLAGS} "$@"
