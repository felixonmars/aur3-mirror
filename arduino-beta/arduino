#!/bin/sh

file=""

if [ -r "$1" ]; then
	file="`echo "$1" | sed "s%^[^/]%$PWD/\\0%"`"
	/usr/share/arduino/arduino "$file"
else
	/usr/share/arduino/arduino
fi
