#!/bin/bash

mkdir -p ~/.jvpn
cd ~/.jvpn

CONFIG=~/.jvpn/jvpn.ini
ETC_CONFIG=/etc/jvpn/jvpn.ini

if [ -f  $CONFIG ];
then
   echo "Using configuration file $CONFIG"
else
   echo "Creating sample configuration at $CONFIG path"
   cp $ETC_CONFIG $CONFIG
   echo "Please edit the configuration file at $CONFIG with your vpn details and rerun the jvpn."
   exit 0
fi

echo "Running jvpn.pl with sudo .."
sudo jvpn.pl
