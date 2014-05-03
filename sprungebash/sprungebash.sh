#!/bin/bash

# sprunge script by Acho Arnold <arnold@archlinux.info>
# version 1.0
# I release this into the public domain. Do with it what you will.

# function to output usage instructions
function usage {
	echo "Usage: $(basename "$0") <filename>" >&2
	echo "Upload a file to sprunge.us and output its URL to stdout." >&2
	echo  -n "If xsel or xclip is available, the URL is put on the X selection clipboard for " >&2
	echo "easy pasting." >&2
}

# check arguments
if [ "$1" = "-h" -o "$1" = "--help" ]; then
	usage
	exit 0
elif [ $# == 0 ]; then
	echo "No file specified" >&2
	usage
	exit 1;
fi

# check curl is available
type curl  >/dev/null 2>&1 || {
	echo "Couldn't find curl, which is required." >&2
	exit 2;
}

if [ ! -f "$1" ]; then
		echo "file '$1' doesn't exist, exiting" >&2;
		exit 3;
fi

url=$(curl -F 'sprunge=<-' http://sprunge.us <"$1" 2>/dev/null)
echo  "$url" >&2;

if [ "$DISPLAY" ]; then
	{ type xsel >/dev/null 2>/dev/null && echo -n "$url" | xsel; } \
		|| { type xclip >/dev/null 2>/dev/null && echo -n "$url" | xclip -selection clipboard; } \
		|| echo "Haven't copied to the clipboard: no xsel or xclip" >&2
else
	echo "Haven't copied to the clipboard: no \$DISPLAY" >&2
fi