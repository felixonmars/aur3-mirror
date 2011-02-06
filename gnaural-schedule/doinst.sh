#!/bin/sh

cd $(dirname "$0")
ls *.gnaural &> /dev/null

if [ $? -eq 0 ]; then
	mkdir -p $HOME/.gnaural
	install -m644 *.gnaural $HOME/.gnaural/
else
	echo "No schedule files found."
	exit 1
fi
