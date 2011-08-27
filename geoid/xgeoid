#!/bin/sh
if [ ! -d $HOME/.geoid ]; then
	mkdir $HOME/.geoid
	cp /usr/share/geoid/country.pos $HOME/.geoid
fi
/usr/bin/geoid
