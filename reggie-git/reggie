#!/bin/sh

[ $# = 0 ] && python /usr/share/reggie/reggie.py

for a in "$@"
do
	if [ -f "$PWD/$a" ]
	then
		python /usr/share/reggie/reggie.py "$PWD/$a"
	else
		python /usr/share/reggie/reggie.py "$a"
	fi
done
