#!/bin/bash

# wakeupneo.sh 1.1 - "The Matrix" scene written in bash
# Copyright: (C) 2012 edloaa <edloaa at googlemail dot com>
# License: GPL-3 <http://www.gnu.org/licenses/gpl-3.0.txt>

teip() {
    str="$@"
    while [ -n "$str" ]; do
        printf "%c" "$str"
        str=${str#?}
        sleep .$(($RANDOM%2+1))
    done
}

slcl() {
    sleep 2
    clear
}

ctrl_c() {
    echo -e '\e[0m'
    clear
    exit 130
}

trap ctrl_c 2 20

msg='Wake up, Neo...
The Matrix has you...
Follow the white rabbit.'

clear
echo -en '\e[1;32m'

echo "$msg" | \
while read line; do
    teip "$line"
    slcl
done

echo -n "Knock, kock, Neo."
slcl

echo -en '\e[0m'
