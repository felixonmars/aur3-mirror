#!/bin/bash
export WINEPREFIX="$HOME"/.legendonline
export XDG_DATA_HOME="$HOME"/.legendonline

if [ ! -d "$HOME"/.legendonline ]; then
	WINEARCH=win32 wineboot -i
	xterm -e "winetricks flash ie8"
	xterm -e "regedit /usr/share/legendonline/ie8-cache.reg"
fi

unlink "$HOME"/.legendonline/drive_c/users/$USER/Área\ de\ Trabalho 2>/dev/null
WINEDEBUG=-all wine "/usr/share/legendonline/Legend Online(pt)1.1.exe" "$@"
