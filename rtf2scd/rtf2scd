#!/bin/bash
# rtf2scd
# Version: 1.0
# if a directory, find rtf files beneath it
if [ -d $1 ]; then
	cd $1
	for i in $(find . -name '*.rtf' -type f); do
		NAME=${i/%.rtf/.scd}
		echo "Converting ${i#*./} to ${NAME#*./}"
		unrtf --text $i > "$NAME"
		sed -i '1,5d' "$NAME"
		rm "$i"
	done
else
echo "Not a directory."
fi
# check if a valid file
if [ -f $1 ]; then
	if [[ $1 == *.rtf* ]]; then
		NAME=${1/%.rtf/.scd}
		echo "Converting $1 to $NAME"
		unrtf --text $1 > "$NAME"
		sed -i '1,5d' "$NAME"
		rm "$1"
	else
		echo "This is not a .rtf file. Exiting..."
	fi
fi
