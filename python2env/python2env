#!/bin/bash
ENVDIR=/tmp/python2env-$RANDOM
mkdir -p $ENVDIR
ln -s /usr/bin/python2 $ENVDIR/python
export PATH="$ENVDIR:$PATH"
if [ -z "$*" ]; then
	[ -z "$SHELL" ] && bash || $SHELL
else
	$*
fi
rm $ENVDIR/python
rmdir $ENVDIR
