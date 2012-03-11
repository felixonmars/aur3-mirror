#!/bin/bash
#
# Runs PCSX2CE from inside a config directory, to store in there its .ini file.
# This directory will be a XDG config dir. Otherwise, will be a hidden dir
# in user's home.

if [ ! -z "$XDG_CONFIG_HOME" ]; then
	CONFIG_DIR="$XDG_CONFIG_HOME"/pcsx2ce
else
	CONFIG_DIR="$HOME"/.pcsx2ce
fi

[ ! -d "$CONFIG_DIR" ] && mkdir -p "$CONFIG_DIR"
cd "$CONFIG_DIR"

java -jar /usr/share/pcsx2ce/pcsx2ce.jar
