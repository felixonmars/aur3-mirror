#!/bin/bash  
if [ ! -d "$HOME"/.tastystatic ]; then
	cp -r /usr/share/tastystatic/ "$HOME"/.tastystatic/ || exit 1
	chmod +x "$HOME"/.tastystatic/tastystatic || exit 1
	[ `uname -m` == "x86_64" ] && chmod +x "$HOME"/.tastystatic/tasty64.sh
fi 

if [ `uname -m` == "i686" ]; then
	cd "$HOME"/.tastystatic
	./tastystatic || exit 1
fi

if [ `uname -m` == "x86_64" ]; then
	cd "$HOME"/.tastystatic
	./tasty64.sh || exit 1
fi
