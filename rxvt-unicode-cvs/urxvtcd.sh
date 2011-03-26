#!/bin/sh
urxvtc "$@"
[ $? -eq 2 ] && urxvtd -q -f -o && exec urxvtc "$@"
