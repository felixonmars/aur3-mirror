#!/bin/bash

#pacman zenity-based GUI
#--by jorchube--

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


function actualiza {
	$USETERM sudo pacman -Syu
	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done
	##### forma vieja #####
	#sleep 3
	#while [ -e /var/lib/pacman/db.lck ]; do
	#	sleep 0.5
	#done 

	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	main

}
######################

function instala {
	INST=$(zenity --entry --title="Install package." --width=350 --text="Type in the package name (or names) you wish to install") || main
	$USETERM sudo pacman -S $INST

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	main
}
#####################
function busca_inst {
	BUSCA_I=$(zenity --entry --title="Repository search." --width=350 --text="Type in as many keywords as you want to search for.") || main
	RES_BUSCA_I=$(pacman -Ss $BUSCA_I) 
	RES_BUSCA_I_SORT=$(echo $RES_BUSCA_I | grep / | tr -s [:blank:] "\n" | grep / | tr -s "/" " ")
	
	echo "$RES_BUSCA_I" | zenity --text-info --width=500 --height=500 --title="Packages found for "\"$BUSCA_I""\" &
	sleep 0.1
	CHECK=$(zenity --list --checklist --title="Package installation." --text="Select packages to be installed" --width=350 --height=500 --column=Instalar --column=Paquete $RES_BUSCA_I_SORT) || busca_inst
	
	
	CHECK_INST=$(echo $CHECK | tr "|" " ")
	$USETERM sudo pacman -S $CHECK_INST	

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done
	
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600	
	main
}

######################

function paclocal {
	LOCFILE=$(zenity --file-selection --title="Select the local package to be installed") || main
	$USETERM sudo pacman -U $LOCFILE

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done

	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	main
}

######################

function makepkg {
	PKGDIR=$(zenity --file-selection --directory --title="Select the directory where the PKGBUILD file is located.") || main

case "$TERMINAL" in
	Gnome-terminal)
	gnome-terminal -t "Package compilation" --working-directory=$PKGDIR -x sudo makepkg -s -r --asroot
;;
	Konsole)
	konsole --working $PKGDIR -e sudo makepkg -s -r --asroot
;;
	Xfce-terminal)
	xfce4-terminal --working-directory=$PKGDIR -x sudo makepkg -s -r --asroot
;;
	Xterm)
	zenity --info --title="D'oh" --text="Sorry, this option isn't available using xterm yet :("
	main
;;
esac

if [ ! $(ls $PKGDIR | grep pkg.tar.gz) ]
	then
		zenity --error --title="PacGUI makpkg error" --text="There was an error so package couldn't be created. Try again manually running from a terminal in the corresponding directory the following command: \n\n sudo makepkg -s -r --asroot"
	else
		notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "Package created in $PKGDIR"	
		zenity --question --title="Local package successfully created" --text="Do you wish to install the new package?" || main
		#gnome-terminal -t "Instalación de paquete local" -x sudo pacman -U $PKGDIR/*.pkg.tar.gz
		$USETERM sudo pacman -U $PKGDIR/*.pkg.tar.gz
	
	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done

		notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
		tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
fi
	main
}
######################

function busca {
	BUSCA=$(zenity --entry --title="Repository search" --width=350 --text="Type in as many keywords as you want to search for") || main
	RES_BUSCA=$(pacman -Ss $BUSCA)
	RES_BUSCA_SORT=$(echo $RES_BUSCA | grep / | tr -s [:blank:] "\n" | grep /)
	echo "$RES_BUSCA" | zenity --text-info --width=500 --height=500 --title="Results for "\"$BUSCA""\" &
	sleep 0.1
	INFO=$(zenity --list --title="Select package" --text="Select package to\nshow detailed info about it" --width=350 --height=500 --column=Paquete $RES_BUSCA_SORT) || busca
	INFO_SORT=$(echo $INFO | tr "|" " ")
	zenity --info --title="Info for "\"$INFO""\" --text="$(echo "$(pacman -Si $INFO_SORT)" | grep -v Packager)" 
	main
}

######################

function busca_local {
	BUSCA=$(zenity --entry --title="Local search" --width=350 --text="Type in as many keywords as you want to search for") || main
	RES_BUSCA=$(pacman -Qs $BUSCA)
	RES_BUSCA_SORT=$(echo $RES_BUSCA | grep / | tr -s [:blank:] "\n" | grep /)
	echo "$RES_BUSCA" | zenity --text-info --width=500 --height=500 --title="Resuls for "\"$BUSCA""\" &
	sleep 0.1
	INFO=$(zenity --list --title="Select un package" --text="Select package to\nshow detailed info about it" --width=350 --height=500 --column=Paquete $RES_BUSCA_SORT) || busca_local
	INFO_SORT="$(echo "$INFO" | tr -s / "\n")"
	zenity --info --title="Información para "\"$INFO""\" --text="$(echo "$(pacman -Qi $INFO_SORT)" | grep -v Packager)"
	main
}
######################

function elimina {
	DESINST=$(zenity --entry --title="Remove package" --width=350 --text="Type in the page name (or names) you wish to remove") || main
	#gnome-terminal -t "Desinstalación de paquete(s)" -x sudo pacman -Rcs $DESINST
	$USETERM sudo pacman -Rcs $DESINST
	
	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done
	

	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	main
}
######################

function busca_elim {
	BUSCA_E=$(zenity --entry --title="Repository search." --width=350 --text="Type in as many keywords as you want to search for.") || main
	RES_BUSCA_E=$(pacman -Qs $BUSCA_E) 
	RES_BUSCA_E_SORT=$(echo $RES_BUSCA_E | grep / | tr -s [:blank:] "\n" | grep / | tr -s "/" " ")
		
	echo "$RES_BUSCA_E" | zenity --text-info --width=500 --height=500 --title="Packages found for "\"$BUSCA_E""\" &
	sleep 0.1
	CHECK=$(zenity --list --checklist --title="Package removal" --text="Select packages to be removed" --width=350 --height=500 --column=Instalar --column=Paquete $RES_BUSCA_E_SORT) || busca_elim
	
	
	CHECK_INST=$(echo $CHECK | tr "|" " ")
	#gnome-terminal -t "Desinstalación de paquete(s)" -x sudo pacman -Rcs $CHECK_INST
	$USETERM sudo pacman -Rcs $CHECK_INST

	sleep 0.5
	until [ ! $(pidof sudo) ]; do
		sleep 0.5
	done
	while [ -e /var/lib/pacman/db.lck ]; do
		sleep 0.5
	done

	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished." "You may look up the log file anytime from the application menu or /var/log/pacman.log"
	tail -n 50 /var/log/pacman.log | tac | zenity --text-info --height=600 --width=600
	main
}
######################

function cache {

	CACHE=$(zenity --list --title="Clean downloaded pacages cache" --text="Select an option" --width=600 --column=" " --column="Option" "1" "Clean only old  packages" "2" "Clean all packages") || main

	case "$CACHE" in

		1)
			#gnome-terminal -t "Eliminando cache" -x sudo pacman -Sc
			$USETERM sudo pacman -Sc
			sleep 0.5
			until [ ! $(pidof sudo) ]; do
				sleep 0.5
			done
			while [ -e /var/lib/pacman/db.lck ]; do
				sleep 0.5
			done

			notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "Old packages cache cleaned."
	;;

		2)
			#gnome-terminal -t "Eliminando cache" -x sudo pacman -Scc
			$USETERM sudo pacman -Scc
			sleep 0.5
			until [ ! $(pidof sudo) ]; do
				sleep 0.5
			done
			while [ -e /var/lib/pacman/db.lck ]; do
				sleep 0.5
			done

			notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "Whole packages cache cleaned."	
	;;
	esac

main
	
}

#####################

function optimize {
	$USETERM sudo pacman-optimize
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "Pacman database has been optimized."
main
}





#####################

function mirrors {
	ACTION=$(zenity --list --title="Rankmirrors" --width=500 --text="WARNING: These actions may take several minutes, depending on the active mirrors number" --column=" " --column="Select an option" "1" "Check active mirrors" "2" "Check mirrors and rank 'rankmirrors' file again.") || main

function para1 {
	#MIRROR=$(zenity --file-selection --title="Rankmirrors" --text="Seleccione el archivo de mirrors" --filename="/etc/pacman.d/mirrorlist")
	TEMP=$(mktemp)	
	function primera {
		echo "# Ranking mirrors.\n\nPlease wait, this can take several minutes.\n"	
		rankmirrors -v "$MIRRORFILE" > "$TEMP"
		}
	primera  | zenity --progress --title="Ranking mirrors" --pulsate --auto-close --auto-kill
	cat "$TEMP" | zenity --text-info --title="Mirrors results" --height=600 --width=800
	rm "$TEMP"
	main
}

function para2 {
	#MIRROR2=$(zenity --file-selection --title="Rankmirrors" --text="Seleccione el archivo de mirrors" --filename="/etc/pacman.d/mirrorlist")
	TEMP=$(mktemp)
	function segunda { 
		echo "# Ranking mirrors and sorting mirrorlist.\n\nPlease wait, This may take several minutes.\n"
		rankmirrors "$MIRRORFILE" > "$TEMP"
		}
	segunda | zenity --progress --title="Ranking mirrors" --pulsate --auto-close --auto-kill
	cat "$TEMP" | zenity --text-info --title="New mirrorlist preview" --height=600 --width=800
	zenity --question --title="Modify mirrorlist" --text="Are you sure you want to modify the\nmirrorlist file with the obtained resultset?" || main
	gksu cp "$TEMP" "$MIRRORFILE"
	rm "$TEMP"
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "Rankmirrors file modified."
	main



}

	case "$ACTION" in

		1)
			para1

;;

		2)
			para2
;;
esac

}


######################

function editrank {
	#RANK=$(zenity --file-selection --title="Editar mirrors de pacman" --text="Seleccione el archivo de mirrors que quiere editar" --filename="/etc/pacman.d/mirrorlist") || main
	gksu $TEXTEDITOR $MIRRORFILE
	main
}	

######################

function showlog {
	zenity --text-info --height=600 --width=800 --filename=/var/log/pacman.log
	main
}

######################

function configura {
	CONFIG=$(zenity --list --title="Configuration" --text="WARNING: For these changes to take effect, you must restart the application" --width=600 --height=210 --column=" " --column="Opción" "1" "Change text editor.   Currently:   $TEXTEDITOR" "2" "Change the mirrorlist file.   Currently:   $MIRRORFILE" "3" "Change the terminal emulator to be used.   Currently:   $TERMINAL") || main

case "$CONFIG" in

		1)
			zenity --entry --text="Type in yor default text editor" --title="Default Editor" --entry-text="$TEXTEDITOR" > ~/.pacmangui/texteditor

;;

		2)
		zenity --file-selection --title="Select the default mirror file" --filename="$MIRRORFILE" > ~/.pacmangui/mirrorlistfile	
;;

		3)
		zenity --list --radiolist --height=250 --text="Select the terminal emulator to be used" --column="" --column="Available terminals" "1" "Gnome-terminal" "2" "Konsole" "3" "Xfce-terminal" "4" "Xterm" > ~/.pacmangui/terminal
;;
esac

main

}

######################

function About {
	zenity --info --title="About..." --text="Zenity PacGUI is a small GUI based on zenity\n for pacman, easy to use and understand.\n\nConceived and created by jorchube.\n\nIf you have any question about any function of this application, visit:\n\nhttp://wiki.archlinux.org/index.php/Main_Page\n\n\n\nThans for their suggestions to:\n\n - Amuchamu (mktemp and text editor selection).\n\n - 4s|m3tr|ko0 (gksu)\n\n - resadent (compilation dependencies).\n\n\n\nProject web site:\nhttp://sourceforge.net/projects/zenitypacgui/\n\n\nEnglish translation: 4s|m3tr|ko0"
	main
}

#####################
function rcmodules {
	zenity --question --title="WARNING" --text="This could be dangerous for your system.\n\nIf you are not sure, don't continue." || main
	TEXT=$(cat /etc/rc.conf | grep "MODULES=(" | tr -d "MODULES=(" | tr -d ")" ) || main
	MODS=$(zenity --entry --width=950 --title="Modules on startup" --text="Modules on startup     !<module>=blacklisted" --entry-text="$TEXT") || main
	zenity --question --title="Modules on startup" --text="THIS COULD BE DANGEROUS!!!\n\nApply changes?\n\n\nNew list of modules on startup:\n\n$MODS" || main
	
	cp /etc/rc.conf ~/.pacmangui/rc.conf.backup
	$USETERM sudo sed -i s/"$TEXT"/"$MODS"/g /etc/rc.conf
	#sudo va (sin &&, osea, sin nada antes), pero quiero darle un poco mas de info al user.
	#con gksu para las dos cosas no va...pero los comandos en si funcionan.  ya vorem como lo haces campeon!!!
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "Daemons on startup modified" "You can undo the last rc.conf modification at Arch Settings menu dialog"
}

####################

function rcdaemons {
	zenity --question --title="WARNING" --text="This could be dangerous for your system.\n\nIf you are not sure, don't continue." || main
	TEXT=$(cat /etc/rc.conf | grep "DAEMONS=(" | tr -d "DAEMONS=(" | tr -d ")" ) || main
	MODS=$(zenity --entry --width=950 --title="Daemons on startup" --text="Daemons on startup     !<daemon>=blacklisted     @<daemon>=backgrounded" --entry-text="$TEXT") || main
	zenity --question --title="Daemons on startup" --text="THIS COULD BE DANGEROUS!!!\n\nApply changes?\n\n\nNew list of daemons on startup:\n\n$MODS" || main
	
	cp /etc/rc.conf ~/.pacmangui/rc.conf.backup
	$USETERM sudo sed -i s/"$TEXT"/"$MODS"/g /etc/rc.conf
	#sudo va (sin &&, osea, sin nada antes), pero quiero darle un poco mas de info al user.
	#con gksu para las dos cosas no va...pero los comandos en si funcionan.  ya vorem como lo haces campeon!!!
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "Daemons on startup modified" "You can undo the last rc.conf modification at Arch Settings menu dialog"
}


####################

function rcconf {
	
	zenity --question --title="Edit rc.conf" --text="THIS COULD BE DANGEROUS!!!\n\nAre you sure you want to edit the rc.conf file?" || main
	cp /etc/rc.conf ~/.pacmangui/rc.conf.backup
	gksu $TEXTEDITOR /etc/rc.conf
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "Daemons on startup modified" "You can undo the last rc.conf modification at Arch Settings menu dialog"
}

####################

function restore {
	zenity --question --title="restore rc.conf" --text="You are going to restore your rc.conf file before the last modification done with zenity_pacgui.\n\nDo you want to continue?" || main
	gksu cp ~/.pacmangui/rc.conf.backup /etc/rc.conf
	notify-send -i /usr/share/icons/gnome/32x32/apps/system-software-update.png -t 7500 "PacGUI - Finished" "Last modification in rc.conf undone"
	main
}



#####################

function primeravez {

	if [ ! "$TEXTEDITOR" ]
	then
	A="0"
	else
	A="1"
	fi
	if [ ! "$MIRRORFILE" ]
	then
	B="0"
	else
	B="1"
	fi
	if [ ! "$TERMINAL" ]
	then
	C="0"
	else
	C="1"
	fi
	E=$(echo "$A$B$C")
	case "$E" in
		111 )
			echo "perfecto"
			echo "$TERMINAL"
			;;
		000 )
			zenity --info --title="Zenity PacGUI" --text="Hi there "$USER"!\n\nIt seems to be the first time you run this application.\n\nPlease go on to configure it, and run it again when config finished (Dont worry, this will be fast)."
			mkdir ~/.pacmangui
			zenity --info --title="Configuration" --text="First, you need to type in your default text editor.\nIf you are unsure, try:\n\nIf you use Gnome:\tgedit\nIf you use KDE:\tkwrite\nIf you use XFCE:\tmousepad"
			zenity --entry --text="Please type in your default text editor." --title="Default Editor" > ~/.pacmangui/texteditor
			zenity --info --title="Configuration" --text="Next, you have to select your mirrorlist file.\n\nIf you are unsure, just select the default matched file."			
			zenity --file-selection --title="Select the default mirrorlist file to be used" --filename="/etc/pacman.d/mirrorlist" > ~/.pacmangui/mirrorlistfile
			zenity --info --title="Configuration" --text="Finally, select your terminal emulator.\nIf you are unsure, select:\n\nIf you use Gnome:\tGnome-Terminal\nIf you use KDE:\tkonsole\nIf you use XFCE:\txfce4-terminal"
			zenity --list --title="Terminal selection" --radiolist --height=250 --text="Select the terminal emulator to be used" --column="" --column="Available terminals" "1" "Gnome-terminal" "2" "Konsole" "3" "Xfce-terminal" "4" "Xterm" > ~/.pacmangui/terminal
			exit
			;;
		* )
			zenity --info --title="Zenity PacGUI" --text="PacGUI wasn't successfully configured .\nPlease continue to configure it, and run it again when finished."
			mkdir ~/.pacmangui
			zenity --info --title="Configuration" --text="First, you need to type in your default text editor.\nIf you are unsure, try:\n\nIf you use Gnome:\tgedit\nIf you use KDE:\tkwrite\nIf you use XFCE:\tmousepad"
			zenity --entry --text="Please type in your default text editor." --title="Default Editor" > ~/.pacmangui/texteditor
			zenity --info --title="Configuration" --text="Next, you have to select your mirrorlist file.\n\nIf you are unsure, just select the default matched file."
			zenity --file-selection --title="Select the default mirrorlist file to be used" --filename="/etc/pacman.d/mirrorlist" > ~/.pacmangui/mirrorlistfile
			zenity --info --title="Configuration" --text="Finally, select your terminal emulator.\nIf you are unsure, select:\n\nIf you use Gnome:\tGnome-Terminal\nIf you use KDE:\tkonsole\nIf you use XFCE:\txfce4-terminal"
			zenity --list --title="Terminal selection" --radiolist --height=250 --text="Select the terminal emulator to be used" --column="" --column="Available terminals" "1" "Gnome-terminal" "2" "Konsole" "3" "Xfce-terminal" "4" "Xterm" > ~/.pacmangui/terminal
			exit
			;;
esac

}




######################

#menu inicial
######################

function main {

	ACCION1=$(zenity --list --title="Zenity PacGUI 0.4" --text="Select your desired option" --height=310 --width=350 --column="" --column="Sections" "1" "Update/Install packages" "2" "Remove packages" "3" "Package search" "4" "Yaourt" "5" "Other operations" "6" "Arch settings" "7" "Configuration" "8" "About this app..." ) || exit

case "$ACCION1" in
	1)
	ACCION11=$(zenity --list --title="Update/Install Packages" --text="Select your desired option" --height=225 --width=350 --column="Command" --column="Action" "Syu" "System update" "S" "Install package(s)" "Ss_S" "Find and install" "U" "Install local package" ) || main
	case "$ACCION11" in
	Syu)
		actualiza #terminada
;;
	S)
		instala #terminada
;;
	Ss_S)
		busca_inst #terminada
;;
	U)
		paclocal #Terminada
;;
esac
;;
	2)
	ACCION12=$(zenity --list --title="Remove packages" --text="Select your desired option" --height=150 --width=350 --column="Command" --column="Action" "Rcs" "Remove package(s)" "Qs_Rcs" "Find and Remove package(s)" ) || main

case "$ACCION12" in
	Rcs)
		elimina #terminada
;;
	Qs_Rcs)
		busca_elim #terminada
;;
esac


;;
	3)
	ACCION13=$(zenity --list --title="Package search" --text="Select your desired option" --height=150 --width=350 --column="Command" --column="Action" "Ss" "Repository search" "Qs" "Local search" ) || main

case "$ACCION13" in
	Ss)
		busca #terminada
;;
	Qs)
		busca_local #terminada
;;
esac

;;
	5)
	ACCION14=$(zenity --list --title="Other operations" --text="Select your desired option" --height=260 --width=465 --column="Command" --column="Action" "makepkg" "compile and create .pkg.tar.gz" "Sc/Scc" "Clean downloaded packages cache" "optimize" "Optimize the pacman database" "rankmirrors" "Rank pacman mirrors speed" "editrank" "Manually edit the pacman mirrors file" "showlog" "look up pacman performed operations logfile" ) || main

case "$ACCION14" in
	makepkg)
		makepkg #TODO xterm
;;
	Sc/Scc)
		cache #Terminada
;;
	rankmirrors)
		mirrors #Terminado
;;
	editrank)
		editrank #Terminado
;;
	showlog)
		showlog #terminado
;;
	optimize)
		optimize #terminado
;;
esac

;;
	7)
	configura #Terminado


;;
	8)
	About #terminado
;;
	6)
	SET=$(zenity --list --title="Arch settings" --text="Select your desired option" --height=225 --width=350 --column="" --column="Option" "1" "Modules on system startup" "2" "Daemons on system startup" "3" "Edit /etc/rc.conf manually" "4" "Undo last operation in rc.conf" ) || main
	case "$SET" in
			1)
			rcmodules
			;;
			2)
			rcdaemons
			;;
			3)
			rcconf
			;;
			4)
			restore
			;;
	esac
;;
	4)
	sh /usr/bin/pacyaourt || main
;;
esac

}


primeravez #Terminada
main #Terminada

