#!/bin/sh
EXECPATH="${XDG_DATA_HOME-$HOME/.local/share}/CortexCommand"

if [ ! -d "${EXECPATH}" ]; then
	cd /opt/CortexCommand/
	find | while read i; do
		if [ -d "${i}" ]; then
			mkdir -p "${EXECPATH}/${i}"
		elif [ "${i##*.}" == "ini" ]; then
			cp "${i}" "${EXECPATH}/${i}"
		else
			ln -s "/opt/CortexCommand${i#.}" "${EXECPATH}${i#.}"
		fi
	done
fi

cd "${EXECPATH}"
./CortexCommand.bin "$@"
