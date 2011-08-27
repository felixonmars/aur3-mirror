#!/bin/sh
# 
# Revisa si el usuario es root
#
function check_root(){
        ROOT_UID=0
        E_NONROOT=67
        if [ "$UID" -ne "$ROOT_UID" ]; then
            printf "$(gettext "%s Necesitas ser root")\n" "$CMD_NAME"
        exit $E_NONROOT
        fi
}

function main(){
	check_root
	gcc mpd-notify.c libmpdclient.c -o mpd-notify
	cp mpd-notify /usr/local/bin/
	cp mpd-notify-daemon /usr/local/bin
	echo "********************************************************"
	echo "Para iniciar mpd-notify ejecutar mpd-notify-daemon start"
	echo ""
	echo "Para iniciarlo automaticamente agregar mpd-notify-daemon start 
	a tus programas de inicio"
	echo " "
	echo "Instalado Correctamente"
	echo " "
}
main $@
