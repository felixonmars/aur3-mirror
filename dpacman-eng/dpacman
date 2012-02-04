#!/bin/bash
#
# ##############################################################################
#
# Name: DPacman
#
# Version: 2010.06
#
# Description: Simple interface, using shell sript and dialog, for pacman.
# Archlinux Package Manager. This program was based on the code
# "PacGUI" created by "jorchube. Thanks! "Jorchube.
# 
# Author: smarch < silveriomm@bol.com.br >
#
# Date: 09/06/2010
#
# ##############################################################################
#
# Version: 2011.04
#
# Date 07/04/2011
# 
# Clean up and store the code.
# Modified the function to install and remove programs, now have an option
# only. They find and install a program name or by keyword.
# Only programs simply choose from a list.
# Also changes were made in search functions.

# ========== CREATE AND DEFINE THE LOCATION OF THE PROGRAM DIRECTORY ===========
	
	mkdir -p $HOME/.dpacman
	
# ==============================================================================

################################################################################
################################################################################

btitle="DPACMAN"
DIALOG=dialog

################ ABOUT #########################################################
################################################################################

function SOBRE {
	
MSG_SOBRE="DPacman is a graphical interface based on dialog, for pacman,
Archlinux package manager.
It is very intuitive and easy to use. It is a totally free program!
You can use, modify and distribute as you wish.
But the author is not liable for any damage
that may cause the program to your system.\nSo use at your own risk!\n
I hope you find it useful!\n\nsilveriomm@bol.com.br\n2011"
	
	$DIALOG					\
		--backtitle $btitle            	\
		--title "About DPacman..."	\
		--msgbox "$MSG_SOBRE"		\
		0 0
		MENUP
	
}

##################### INSTALL PROGRAM ##########################################
################################################################################

function INSTALAR {
	
MSG_INST="Enter a keyword, or program name"	
	
	BUSCA=$(
		$DIALOG					\
			--stdout			\
			--backtitle $btitle		\
			--title "INSTALL PROGRAM"	\
			--inputbox "$MSG_INST"		\
			08 70) || MENUP
	
	clear

	RESP_BUSCA=$(sudo pacman -Ss $BUSCA > $HOME/.dpacman/TMP.txt)
	
	cat $HOME/.dpacman/TMP.txt | cut -d " " -f1 | tr -s "/" " " |	\
	sed s/$/" off"/ | awk '{ print $2 " " $1}' > $HOME/.dpacman/TMP2.txt
	
	ORD_LISTA=$(cat $HOME/.dpacman/TMP2.txt)
	
MSG_LISTA="\nResults found for: $BUSCA\n\n
Select the programs you want to install"
	
	$DIALOG 						\
		--stdout					\
		--backtitle $btitle				\
		--title "INSTALL PROGRAM"			\
		--separate-output				\
		--checklist "$MSG_LISTA"			\
		 0 75 0 $ORD_LISTA > $HOME/.dpacman/TMP3.txt
	
	if [ $? = 1 ]
		then
			MENUP
		else 
			PEGA=$(cat $HOME/.dpacman/TMP3.txt)
			clear && sudo pacman -S $PEGA
			MENUP
	fi
	
}

############# INSTALL LOCAL PROGRAM ############################################
################################################################################

function INSTALA_LOCAL {
	
MSG_LOCAL="SELECT THE PROGRAM YOU WISH TO INSTALL"
	
	LOCAL=$(
		$DIALOG				\
			--stdout		\
			--backtitle $btitle	\
			--title "$MSG_LOCAL"	\
			--fselect /home/$USER	\
			08 70)
	
	if [ $? = 1 ]
		then
			MENUP
		else
			clear && sudo pacman -U $LOCAL
			MENUP
	fi

}

################## REMOVE PROGRAM ##############################################
################################################################################

function REMOVER {	
	
MSG_REM="Enter a keyword, or program name"

	
	BUSCA=$(	
		$DIALOG                        		\
			--stdout                 	\
			--backtitle $btitle      	\
			--title "REMOVE PROGRAM"	\
			--inputbox "$MSG_REM" 		\
			 08 70) || MENUP
	
	clear
	
	RESP_BUSCA=$(sudo pacman -Ss $BUSCA > $HOME/.dpacman/TMP.txt)
	
	cat $HOME/.dpacman/TMP.txt | cut -d " " -f1 | tr -s "/" " " |	   \
	sed s/$/" off"/ | awk '{ print $2 " " $1}' > $HOME/.dpacman/TMP2.txt
	
	ORD_LISTA=$(cat $HOME/.dpacman/TMP2.txt)
	
MSG_LISTA_REM="\nResults found for: $BUSCA\n\n
Select the programs you want to remove"
	
	$DIALOG							\
		--stdout					\
		--backtitle $btitle				\
		--title "REMOVE PROGRAM"			\
		--separate-output				\
		--checklist "$MSG_LISTA_REM"			\
		0 75 0  $ORD_LISTA > $HOME/.dpacman/TMP3.txt
	
	if [ $? = 1 ]
		then
			MENUP
		else 
			PEGA=$(cat $HOME/.dpacman/TMP3.txt)
			clear && sudo pacman -R $PEGA
			MENUP
	fi
	
}

################### PROGRAM SEARCH #############################################
################################################################################

function LOCALIZA {
	
MSG_LOCALIZA="Enter a keyword, or program name"
	
	BUSCA=$(
		$DIALOG					\
			--stdout			\
			--backtitle $btitle		\
			--title "PROGRAM SEARCH"	\
			--inputbox "$MSG_LOCALIZA"	\
			08 72)

	if [ $? = 1 ]
		then
			MENUP
		else
			clear

			sudo pacman -Ss $BUSCA > $HOME/.dpacman/busca.txt
			
MSG_BUSCA_MOSTRA="Results found for: $BUSCA"
		
	$DIALOG						\
		--backtitle $btitle			\
		--title "$MSG_BUSCA_MOSTRA"		\
		--textbox $HOME/.dpacman/busca.txt	\
		0 0
		MENUP
	fi
}

############## UPDATE SYSTEM ###################################################
################################################################################

function MENU_ATUALIZA {
	
	ATUALIZA=$(
		
		$DIALOG							\
			--stdout					\
			--cancel-label "Return"				\
			--backtitle $btitle				\
			--title "UPDATE SYSTEM"				\
			--menu "What to do?"				\
			0 0 0						\
				1 "Update System"			\
				2 "Update only the database"		\
				3 "Update database forced") ||
				MENUP
	
	case $ATUALIZA in
	
		1) 	clear
			sudo pacman -Syu
			MENUP ;;
	 
		2) 	clear	
			sudo pacman -Sy
			MENUP ;;
	 
		3)	clear	
			sudo pacman -Syy
			MENUP ;;
	esac
}

################### OTHER ACTIVITIES ###########################################
################################################################################

################# CLEAR CACHE ##################################################

function LIMPA_CACHE {
	
	CACHE=$(
		$DIALOG                    				\
			--stdout                               		\
			--cancel-label "Return"                		\
			--backtitle $btitle                    		\
			--title "CLEAR CACHE"                 		\
			--menu "What to do?"				\
			0 0 0     					\
				1 "Clear old packages from cache"	\
				2 "Delete all cache package") ||
				MENUO

	case $CACHE in
	
		1)	clear
			sudo pacman -Sc
			MENUO ;;
	
		2) 	clear	
			sudo pacman -Scc
			MENUO ;;

	esac
	
}

################# DETAILS OF PROGRAMS INSTALLED ################################

MSG_INFO="Enter the program name to learn more details about the"

function BUSCA_INFO {
	
	INFO=$(
		$DIALOG							\
			--stdout					\
			--backtitle $btitle				\
			--title "DETAILS OF PROGRAMS INSTALLED"		\
			--inputbox "$MSG_INFO"				\
			08 70)
	
	if [ $? = 1 ]
		then
			MENUO
		else
			RESP_INFO=$(pacman -Qi $INFO)
			echo "$RESP_INFO" > $HOME/.dpacman/INFO.TEMP
			$DIALOG						     \
				--backtitle $btitle			     \
				--title "Program Information:  $INFO "       \
				--textbox $HOME/.dpacman/INFO.TEMP	     \
				0 0
				MENUO
	
	fi
}

##################### LIST OF PACKAGES LOST ####################################

function LISTA {		
	
	clear
	sudo pacman -Qdt > $HOME/.dpacman/LIST.TEMP
	$DIALOG						\
		--title "LIST OF PACKAGES LOST"		\
		--textbox $HOME/.dpacman/LIST.TEMP	\
		0 0
	MENUO
}

################# EDIT /etc/rc.conf  ###########################################

function RCCONF {
	
MSG_RCCONF="\nAre you sure? Want to edit the file /etc/rc.conf now?"
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "DANGER, THIS CAN DAMAGE THE SYSTEM"	\
		--yesno  "$MSG_RCCONF"				\
		07 70
	
	if [ $? == 1 ] 
		then
			MENUO
		else
			clear
			cp /etc/rc.conf $HOME/.dpacman/rc.conf.backup
			sudo mcedit /etc/rc.conf
			MENUO
			
	fi
}

################ EDIT /etc/pacman.conf  ########################################

MSG_PACCONF="\nAre you sure? Want to edit the file /etc/pacman.conf now?"

function PACCONF {
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "DANGER, THIS CAN DAMAGE THE SYSTEM"	\
		--yesno "$MSG_PACCONF"				\
		07 70

	if [ $? = 1 ] 
		then
			MENUO
		else
			clear
			cp /etc/pacman.conf $HOME/.dpacman/pacman.conf.backup &&
			sudo mcedit /etc/pacman.conf
			MENUO
			
	fi
}

####################### EDIT /etc/pacman.d/mirrorlist  #########################

MSG_MIRROR="\nAre you sure?
Want to edit the file /etc/pacman.d/mirrorlist now?"

function MIRROR {
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "DANGER, THIS CAN DAMAGE THE SYSTEM"	\
		--yesno "$MSG_MIRROR"				\
		07 70

	if [ $? = 1 ] 
		then
			MENUO
		else
			clear
			cp /etc/pacman.d/mirrorlist		\
			$HOME/.dpacman/mirrorlist.backup &&
			sudo mcedit /etc/pacman.d/mirrorlist
			MENUO
			
	fi

}

###################### Restore /etc/rc.conf ####################################

MSG_REST_RCONF="\nAre you sure? Want to restore the file /etc/rc.conf now?"

function REST_RCONF {
		
	$DIALOG							\
		--backtitle $btitle				\
		--title "DANGER, THIS CAN DAMAGE THE SYSTEM"	\
		--yesno "$MSG_REST_RCONF"			\
		07 70

	if [ $? = 1 ]
		then
			MENU_RESTAURA
		else
			clear
			sudo cp $HOME/.dpacman/rc.conf.backup /etc/rc.conf
			MENU_RESTAURA 
	fi
	
}

################### Restore /etc/pacman.conf ###################################

MSG_REST_PACMANCONF="\nAre you sure?
Want to restore the file /etc/pacman.conf now?"

function REST_PACMANCONF {
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "DANGER, THIS CAN DAMAGE THE SYSTEM"	\
		--yesno "$MSG_REST_PACMANCONF"			\
		07 70
	
	if [ $? = 1 ]
		then
			MENU_RESTAURA
		else
			clear
			sudo cp $HOME/.dpacman/pacman.conf.backup	\
			/etc/pacman.conf
			MENU_RESTAURA
	fi
	
}

############### Restore /etc/pacman.d/mirrorlist ###############################

function REST_MIRROR {
	
MSG_REST_MIRROR="\nAre you sure?
Want to restore the file /etc/pacman.d/mirrorlist now?"	
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "DANGER, THIS CAN DAMAGE THE SYSTEM"	\
		--yesno "$MSG_REST_MIRROR"			\
		07 70

	if [ $? = 1 ]
		then
			MENU_RESTAURA
		else
			clear
			sudo cp $HOME/.dpacman/mirrorlist.backup 	\
			/etc/pacman.d/mirrorlist
			MENU_RESTAURA
	fi
	
}

################## Restore files ###############################################

function MENU_RESTAURA {
	
	RESTAURA=$(
		$DIALOG							\
			--stdout					\
			--cancel-label "Return"				\
			--backtitle $btitle				\
			--title "RESTORE FILES"				\
			--menu "\nWhat to do?"				\
			0 0 0  						\
				1 "Restore /etc/rc.conf"		\
				2 "Restore /etc/pacman.conf"		\
				3 "Restore /etc/pacman.d/mirrorlist") ||
				MENUO

	case $RESTAURA in

		1)	REST_RCONF ;;
		
		2)	REST_PACMANCONF ;;
			
		3)	REST_MIRROR ;;

	esac
	
}

################ Unlock database ###############################################

MSG_DESTRAVA="\nAre you sure? Want to unlock the database now?"

function DESTRAVA {
	
	$DIALOG						\
		--backtitle $btitle			\
		--title "UNLOCK DATABASE"	\
		--yesno "$MSG_DESTRAVA"			\
		07 60
	
	if [ $? = 1 ]
		then
			MENUO	
		else
			clear
			sudo rm /var/lib/pacman/db.lck
			$DIALOG						     \
				--backtitle $btitle			     \
				--msgbox "The database has been unlocked"    \
				08 30
			MENUO
	fi

}

############## OTHER ACTIVITIES MENU ###########################################
################################################################################

function MENUO {
	
	MENU_OUTROS=$(
		$DIALOG                  				\
			--stdout                               		\
			--cancel-label "Return"                		\
			--backtitle $btitle                    		\
			--title "OTHER ACTIVITIES"            		\
			--menu "\nWhat to do?"				\
			0 0 0     					\
				1 "Clear Cache"				\
				2 "Details of programs installed"	\
				3 "List of packages lost"          	\
				4 "Edit /etc/rc.conf"                	\
				5 "Edit /etc/pacman.conf"            	\
				6 "Edit /etc/pacman.d/mirrorlist"	\
				7 "Restore files"			\
				8 "Unlock database") || MENUP
	
	case $MENU_OUTROS in
	
		1)	LIMPA_CACHE ;;
		
		2)	BUSCA_INFO ;;
		
		3)	LISTA ;;
		
		4)	RCCONF ;;
		
		5)	PACCONF ;;

		6)	MIRROR ;;
	
		7)	MENU_RESTAURA ;;
		
		8) 	DESTRAVA ;;

	esac

}

##################### MAIN MENU ################################################
################################################################################

function MENUP {
	
	MENU=$(
		$DIALOG                       			\
			--stdout                             	\
			--backtitle $btitle                  	\
			--title "MAIN MENU"             	\
			--no-cancel                          	\
			--menu "\n       What to do?"		\
			0 0 0					\
				1 "Install Program"		\
				2 "Install local program"	\
				3 "Remove Program"		\
				4 "Find Program"		\
				5 "System Upgrade"		\
				6 "Other activities"		\
				7 "About DPacman"	\
				8 "Exit")
	
	case $MENU in
	
		1)	INSTALAR ;;
		
		2)	INSTALA_LOCAL ;;
		
		3) 	REMOVER ;;
		
		4) 	LOCALIZA ;;
		
		5) 	MENU_ATUALIZA ;;
		
		6) 	MENUO ;;
		
		7) 	SOBRE ;;
		
		8) 	clear && exit

	esac

}

MENUP




