#!/bin/sh

if [ ! -d "$HOME/.rimworld" ]; then
	echo "done"
	mkdir "$HOME/.rimworld"
fi

cd "$HOME/.rimworld"

if [ ! -d "Data" ]; then
	ln -s "/usr/share/rimworld/Data" "Data"
fi

if [ ! -d "Mods" ]; then
	cp -r "/usr/share/rimworld/Mods" "Mods"
fi

# Can't use a symlink, because RimWorld finds its Data directory based on the
# target of /proc/self/exe.
if type rsync >/dev/null 2>/dev/null; then
	rsync -iEt "/usr/share/rimworld/rimworld.bin" "rimworld.bin"
else
	cp -f "/usr/share/rimworld/rimworld.bin" "rimworld.bin"
fi

LC_ALL=C "./rimworld.bin" $@
