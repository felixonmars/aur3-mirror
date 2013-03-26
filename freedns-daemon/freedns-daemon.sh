#!/bin/bash

#place here your direct url, should be something similar to "http://freedns.afraid.org/dynamic/update.php?BLABLABLABALBALdasdsadas=="
DIRECT_URL="COPY HERE YOUR DIRECT URL"

while true;
do
        wget -qO- --waitretry=5 --tries=400 $DIRECT_URL
        sleep 1h
done
