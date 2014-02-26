#!/bin/bash
[[ -f '/etc/iron/default' ]] && . '/etc/iron/default'

/opt/iron/iron ${IRON_FLAGS} "$@"
