#! /bin/bash
PWD=$(pwd)
ARGS=""
FILE="yes"
for ARG in "$@"
do
	if [[ $ARG == -* || $FILE == no ]] ;
	then
	    ARGS="$ARGS $ARG"
	    FILE="no"
	else
		ARGS="$ARGS $PWD/$ARG"
	fi
done
cd /usr/lib/higgs
exec ./higgs $ARGS
