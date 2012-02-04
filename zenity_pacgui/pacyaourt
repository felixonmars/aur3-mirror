#!/bin/bash

TEXTEDITOR=$(cat ~/.pacmangui/texteditor)
MIRRORFILE=$(cat ~/.pacmangui/mirrorlistfile)
TERMINAL=$(cat ~/.pacmangui/terminal)


case "$TERMINAL" in
		Gnome-terminal)
		USETERM="gnome-terminal -x"
		;;
		Konsole)
		USETERM="konsole -e"
		;;
		Xfce-terminal)
		USETERM="xfce4-terminal -x"
		;;
		Xterm)
		USETERM="xterm -e"
		;;
esac

########################



function refresh {
	$USETERM sudo yaourt -Sy

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done

	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "Yaourt database refreshed."
	mainyaourt
}

###################


function upgrade {
$USETERM sudo yaourt -Su --aur

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done


	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "AUR packages upgraded."

	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	mainyaourt
}

######################

function search {
	BUSCA=$(zenity --entry --title="Yaourt search" --width=350 --text="Type in as many keywords as you want to search for") || mainyaourt
	echo "ColorMod TextOnly" > ~/.yaourtrc
	RES_BUSCA=$(yaourt -Ss $BUSCA)
	rm ~/.yaourtrc
	RES_BUSCA_SORT=$(echo $RES_BUSCA | grep / | tr -s [:blank:] "\n" | grep /)
	echo "$RES_BUSCA" | zenity --text-info --width=500 --height=500 --title="Results for "\"$BUSCA""\" &
	sleep 0.1
	INFO=$(zenity --list --title="Select package" --text="Select package to\nshow detailed info about it" --width=350 --height=500 --column=Paquete $RES_BUSCA_SORT) || search
	INFO_SORT=$(echo $INFO | tr "|" " ")
	echo "ColorMod TextOnly" > ~/.yaourtrc
	zenity --info --title="Info for "\"$INFO""\" --text="$(echo "$(yaourt -Si $INFO_SORT)" | grep -v Packager)" 
	rm ~/.yaourtrc
	mainyaourt
}

######################

function install {

	INST=$(zenity --entry --title="Install AUR package." --width=350 --text="Type in the package name you wish to install") || mainyaourt
	$USETERM sudo yaourt -S $INST

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	mainyaourt
}

#####################

function search_install {

	BUSCA_I=$(zenity --entry --title="Repository search." --width=350 --text="Type in as many keywords as you want to search for.") || mainyaourt
	echo "ColorMod TextOnly" > ~/.yaourtrc
	RES_BUSCA_I=$(yaourt -Ss $BUSCA_I)
	rm ~/.yaourtrc
	RES_BUSCA_I_SORT=$(echo $RES_BUSCA_I | grep / | tr -s [:blank:] "\n" | grep / | tr -s "/" " ")
	
	echo "$RES_BUSCA_I" | zenity --text-info --width=500 --height=500 --title="Packages in AUR found for "\"$BUSCA_I""\" &
	sleep 0.1
	CHECK=$(zenity --list --radiolist --title="Package installation." --text="Select package to be installed" --width=350 --height=500 --column=Instalar --column=Paquete $RES_BUSCA_I_SORT) || busca_inst
	
	
	CHECK_INST=$(echo $CHECK | tr "|" " ")
	$USETERM sudo yaourt -S $CHECK_INST	

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done
	
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600	
	mainyaourt
}





#####################



function mainyaourt {

ACCION=$(zenity --list --title="Yaourt operations" --text="Select your desired option" --height=250 --width=350 --column="" --column="Sections" "1" "Refresh database" "2" "Upgrade AUR packages" "3" "Package search" "4" "Install" "5" "Search and install" ) || exit


case "$ACCION" in
	1)
		refresh #yeah
;;
	2)
		upgrade #yeah
;;
	3)
		search #yeah
;;
	4)
		install #yeah
;;
	5)
		search_install #yeah
;;
esac
}

mainyaourt
