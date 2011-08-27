#!/bin/sh

cd /usr/share/packetgarden

if [ ! -d ~/.packetgarden ]; then
	echo "First run, creating data directory..."
	mkdir -p ~/.packetgarden
	cp -rf config data guide logs labels stats ~/.packetgarden/
fi

./pg_garden.py
