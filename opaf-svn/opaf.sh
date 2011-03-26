#!/bin/bash

myhelp() {
	echo "Usage: $0 <pdf-file>"
}

if [ $# -eq 1 ]; then
	python /opt/opaf/opaf.py $1
else
	myhelp
fi
