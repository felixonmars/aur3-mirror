#!/bin/sh
cd /var/lib/openbazaar/node
PUBLICIP=$(curl icanhazip.com)
COMMANDS="--disable-open-browser -i $PUBLICIP -q 8888 -p 12345 --enable-ip-checker"
export PYTHONPATH=/var/lib/openbazaar:/usr/lib/python2.7/site-packages/
python2 openbazaar.py $COMMANDS start
