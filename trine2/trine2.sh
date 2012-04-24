#!/bin/sh

if [ ! -d $HOME/.frozenbyte/Trine2/install_dir.txt ]; then
	mkdir -p "$HOME/.frozenbyte/Trine2"
fi


if [ ! -f $HOME/.frozenbyte/Trine2/install_dir.txt ]; then
	echo "TRINE2_INSTALL_DIR=/usr/share/trine2" > "$HOME/.frozenbyte/Trine2/install_dir.txt"
fi


cd /usr/share/trine2

LD_LIBRARY_PATH="./lib/lib32/:${LD_LIBRARY_PATH}" nohup ./bin/trine2_linux_launcher_32bit >/dev/null &
