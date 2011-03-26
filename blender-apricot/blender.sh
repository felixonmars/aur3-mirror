#!/bin/sh
if [ -e ~/.blender ] && [ -d ~/.blender ]; then
	exec /usr/share/blender/blender $*;
else
	mkdir ~/.blender
	cp -a /usr/share/blender/scripts ~/.blender/scripts;
	cp /usr/share/blender/.Blanguages ~
	exec /usr/share/blender/blender $*;
fi
