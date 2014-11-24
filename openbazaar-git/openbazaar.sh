#!/bin/sh
cd /var/lib/openbazaar/node
PUBLICIP=$(get-public-ip)
COMMANDS="--disable-open-browser -i $PUBLICIP -q 8888 -p 12345 --enable-ip-checker"
python2 openbazaar.py $COMMANDS start
