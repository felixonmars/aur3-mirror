#!/bin/bash

if [[ ! -e "/usr/share/qooxdoo/tool/bin/$1"  || -z "$1" ]]; then
	
	files=`ls -m /usr/share/qooxdoo/tool/bin`
	
	echo "qooxdoo launcher script"
	echo "Usage: qd [qooxdoo script name]"
	echo ""
	echo "Valid qooxdoo script names:"
	echo "$files"
	echo ""
	echo "(They can be found at /usr/share/qooxdoo/tool/bin)"
	echo ""
	echo "Example:"
	echo "	qd create-application.py"
	
else
	/usr/share/qooxdoo/tool/bin/$*
fi
