#!/bin/sh
cd /var/lib/openbazaar/
PUBLICIP=$(curl icanhazip.com)
COMMANDS="--disable-open-browser -i $PUBLICIP -q 8888 -p 12345 --enable-ip-checker"
python2 node/openbazaar.py $COMMANDS start
