#!/bin/bash

if [ ! -e $HOME/.sdlpal ] ; then
	echo "No game data, put them under $HOME/.sdlpal"
	exit 1
fi
cd $HOME/.sdlpal/
exec /usr/share/sdlpal/sdlpal
