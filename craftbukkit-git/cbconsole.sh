#!/bin/bash
status=`rc.d list started | grep craftbukkit`
if [ -z "$status" ]
then
	echo "Please start the Craftbukkit server"
else
	tmux -S /tmp/craftbukkit-console attach
fi
