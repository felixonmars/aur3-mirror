#!/bin/bash

case "$(uname -m)" in
x86_64)
        export WINEARCH="win64"
        program_files_suffix=" (x86)"
        ;;
*)
        export WINEARCH="win32"
        program_files_suffix=""
        ;;
esac

program_name="labelflash-index-maker"
executable_name="LIM.EXE"
export WINEPREFIX="$HOME/.$program_name/wine"
export WINEDEBUG="-all"
export WINEDLLOVERRIDES="mscoree,mshtml="
local_program_path="$WINEPREFIX/drive_c/Program Files$program_files_suffix/$program_name"
usr_program_path="/usr/share/$program_name"

if [[ ! -e "$local_program_path" ]]
then
	mkdir -p "$WINEPREFIX"
	wineboot -u
	mkdir "$local_program_path"
	cp -r "$usr_program_path/"* "$local_program_path"
fi

cd "$local_program_path"
wine "$executable_name" "$@"
