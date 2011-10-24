#!/bin/sh
# could be done better, but works for now.

CONFDIR=$HOME/.frogmod

[ ! -d $CONFDIR ] && \
	mkdir -p $CONFDIR

cd $CONFDIR

[ ! -f config.cfg ] && \
	touch config.cfg

[ ! -f stdlib.cfg ] && \
	ln -s /opt/frogmod-justice/stdlib.cfg .

[ ! -f server-init.cfg ] && \
	cp /opt/frogmod-justice/server-init-example.cfg \
	   server-init.cfg

[ ! -d web ] && \
	ln -s /opt/frogmod-justice/web/ .

/opt/frogmod-justice/bin/frogserv

