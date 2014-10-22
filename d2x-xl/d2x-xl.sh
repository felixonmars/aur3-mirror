#!/bin/sh
if [ ! -d $HOME/.d2x-xl/config ]; then
	mkdir -p $HOME/.d2x-xl/config
fi

if [ ! -e $HOME/.d2x-xl/config/d2x.ini ]; then
	cp /opt/d2x-xl/config/d2x-default.ini $HOME/.d2x-xl/config/d2x.ini
fi

if [ ! -e $HOME/.d2x-xl/config/descent.cfg ]; then
	cp /opt/d2x-xl/config/descent.cfg $HOME/.d2x-xl/config/descent.cfg
fi

/opt/d2x-xl/bin/d2x-xl -datadir /opt/d2x-xl -userdir $HOME/.d2x-xl
