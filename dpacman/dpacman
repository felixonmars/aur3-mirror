#!/bin/bash
#
# ##############################################################################
#
# Nome: DPacman
#
# Versão: 2010.06
#
# Descrição: Uma interface simples, usando shell sript e dialog, para o pacman.
#            Gerenciador de pacotes do Archlinux. Este programa foi baseado nos 
#            códigos do "PacGUI", criado por "jorchube". Obrigado! "jorchube".
# 
# Autor: smarch < silveriomm@bol.com.br >
#
# Data: 09/06/2010
#
# ##############################################################################
#
# Versão: 2011.04
#
# Data 07/04/2011
# 
# Limpeza e arrumação do código.
# Foram modificadas as funções instalar e remover programas, agora
# tem uma opção somente. Elas Localizam e instalam um program pelo
# nome ou palavra-chave. Bastando somente escolher os programas em uma lista.
# Também foram feitas alterações nas funçṍes de buscas.

# ========== CRIA E DEFINE A LOCALIZAÇÃO DO DIRETÓRIO DO PROGRAMA ==============
	
	mkdir -p $HOME/.dpacman
	
# ==============================================================================

################ VARIÁVEIS #####################################################
################################################################################

btitle="DPACMAN"
DIALOG=dialog

################ SOBRE #########################################################
################################################################################

function SOBRE {
	
MSG_SOBRE="DPacman, é uma interface gráfica,
baseada em dialog, para o pacman,
gerenciador de pacotes do Archlinux.
É muito intuitiva, e fácil de usar.
É um programa totalmente livre!
Você pode usar, modificar e distribuir
como bem entender.
Porém o autor não se responsabiliza,
por qualquer dano que o programa
possa causar ao seu sistema.\n
Portanto use por sua conta e risco!\n
Espero que lhe seja útil!\n\n
silveriomm@bol.com.br\n
2010"
	
	$DIALOG					\
		--backtitle $btitle            	\
		--title "Sobre o DPacman..."	\
		--msgbox "$MSG_SOBRE"		\
		0 0
		MENUP
	
}

##################### INSTALAR PROGRAMA ########################################
################################################################################

function INSTALAR {
	
MSG_INST="Digite uma palavra-chave, ou nome do programa"	
	
	BUSCA=$(
		$DIALOG					\
			--stdout			\
			--backtitle $btitle		\
			--title "INSTALAR PROGRAMA"	\
			--inputbox "$MSG_INST"		\
			08 70) || MENUP
	
	clear

	RESP_BUSCA=$(sudo pacman -Ss $BUSCA > $HOME/.dpacman/TMP.txt)
	
	cat $HOME/.dpacman/TMP.txt | cut -d " " -f1 | tr -s "/" " " |	\
	sed s/$/" off"/ | awk '{ print $2 " " $1}' > $HOME/.dpacman/TMP2.txt
	
	ORD_LISTA=$(cat $HOME/.dpacman/TMP2.txt)
	
MSG_LISTA="\nResultados encontrados para: $BUSCA\n\n
Selecione os programas que deseja instalar"
	
	$DIALOG 						\
		--stdout					\
		--backtitle $btitle				\
		--title "INSTALAR PROGRAMA"			\
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

############# INSTALAR PROGRAMA LOCAL ##########################################
################################################################################

function INSTALA_LOCAL {
	
MSG_LOCAL="SELECIONE O PROGRAMA QUE DESEJA INSTALAR"
	
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

################## REMOVER PROGRAMA ############################################
################################################################################

function REMOVER {	
	
MSG_REM="Digite uma palavra-chave, ou nome do programa"

	
	BUSCA=$(	
		$DIALOG                        		\
			--stdout                 	\
			--backtitle $btitle      	\
			--title "REMOVER PROGRAMA"	\
			--inputbox "$MSG_REM" 		\
			 08 70) || MENUP
	
	clear
	
	RESP_BUSCA=$(sudo pacman -Ss $BUSCA > $HOME/.dpacman/TMP.txt)
	
	cat $HOME/.dpacman/TMP.txt | cut -d " " -f1 | tr -s "/" " " |	   \
	sed s/$/" off"/ | awk '{ print $2 " " $1}' > $HOME/.dpacman/TMP2.txt
	
	ORD_LISTA=$(cat $HOME/.dpacman/TMP2.txt)
	
MSG_LISTA_REM="\nResultados encontrados para: $BUSCA\n\n
Selecione os programas que deseja remover"
	
	$DIALOG							\
		--stdout					\
		--backtitle $btitle				\
		--title "REMOVER PROGRAMA"			\
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

################### LOCALIZAR PROGRAMA #########################################
################################################################################

function LOCALIZA {
	
MSG_LOCALIZA="Digite uma palavra-chave, ou o nome do programa"
	
	BUSCA=$(
		$DIALOG					\
			--stdout			\
			--backtitle $btitle		\
			--title "LOCALIZAR PROGRAMA"	\
			--inputbox "$MSG_LOCALIZA"	\
			08 72)

	if [ $? = 1 ]
		then
			MENUP
		else
			clear

			sudo pacman -Ss $BUSCA > $HOME/.dpacman/busca.txt
			
MSG_BUSCA_MOSTRA="Resultados encontrados para: $BUSCA"
		
	$DIALOG						\
		--backtitle $btitle			\
		--title "$MSG_BUSCA_MOSTRA"		\
		--textbox $HOME/.dpacman/busca.txt	\
		0 0
		MENUP
	fi
}

############## ATUALIZAR SISTEMA ###############################################
################################################################################

function MENU_ATUALIZA {
	
	ATUALIZA=$(
		
		$DIALOG							\
			--stdout					\
			--cancel-label "Voltar"				\
			--backtitle $btitle				\
			--title "ATUALIZAR SISTEMA"			\
			--menu "O que deseja fazer?"			\
			0 0 0						\
				1 "Atualizar sistema"			\
				2 "Atualizar somente a base de dados"	\
				3 "Atualizar base de dados forçado") ||
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

################### OUTRAS ATIVIDADES ##########################################
################################################################################

################# LIMPAR CACHE #################################################

function LIMPA_CACHE {
	
	CACHE=$(
		$DIALOG                    				\
			--stdout                               		\
			--cancel-label "Voltar"                		\
			--backtitle $btitle                    		\
			--title "Limpar cache"                 		\
			--menu "O que deseja fazer?"			\
			0 0 0     					\
				1 "Limpar pacotes antigos do cache"	\
				2 "Apagar todos os pacotes do cache") ||
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

################# DETALHES DOS PROGRAMAS INSTALADOS ############################

MSG_INFO="Digite o nome do programa, para saber mais detalhes sobre o mesmo"

function BUSCA_INFO {
	
	INFO=$(
		$DIALOG							\
			--stdout					\
			--backtitle $btitle				\
			--title "Detalhes de programas instalados"	\
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
				--title "Informações do programa:  $INFO "   \
				--textbox $HOME/.dpacman/INFO.TEMP	     \
				0 0
				MENUO
	
	fi
}

##################### LISTA DE PACOTES PERDIDOS ################################

function LISTA {		
	
	clear
	sudo pacman -Qdt > $HOME/.dpacman/LIST.TEMP
	$DIALOG						\
		--title "Lista de pacotes Perdidos"	\
		--textbox $HOME/.dpacman/LIST.TEMP	\
		0 0
	MENUO
}

################# EDITAR /etc/rc.conf  #########################################

function RCCONF {
	
MSG_RCCONF="\nTem certeza? Deseja editar o arquivo /etc/rc.conf agora?"
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "PERIGO, ISTO PODE DANIFICAR O SISTEMA"	\
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

################ EDITAR /etc/pacman.conf  ######################################

MSG_PACCONF="\nTem certeza? Deseja editar o arquivo /etc/pacman.conf agora?"

function PACCONF {
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "PERIGO, ISTO PODE DANIFICAR O SISTEMA"	\
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

####################### EDITAR /etc/pacman.d/mirrorlist  #######################

MSG_MIRROR="\nTem certeza?\n
Deseja editar o arquivo /etc/pacman.d/mirrorlist agora?"

function MIRROR {
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "PERIGO, ISTO PODE DANIFICAR O SISTEMA"	\
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

###################### Restaurar /etc/rc.conf ##################################

MSG_REST_RCONF="\nTem certeza? Deseja restaurar o arquivo /etc/rc.conf agora?"

function REST_RCONF {
		
	$DIALOG							\
		--backtitle $btitle				\
		--title "PERIGO, ISTO PODE DANIFICAR O SISTEMA"	\
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

################### Restaurar /etc/pacman.conf #################################

MSG_REST_PACMANCONF="\nTem certeza?\n
Deseja restaurar o arquivo /etc/pacman.conf agora?"

function REST_PACMANCONF {
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "PERIGO, ISTO PODE DANIFICAR O SISTEMA"	\
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

############### Restaurar /etc/pacman.d/mirrorlist #############################

function REST_MIRROR {
	
MSG_REST_MIRROR="\nTem certeza?\n
Deseja restaurar o arquivo /etc/pacman.d/mirrorlist agora?"	
	
	$DIALOG							\
		--backtitle $btitle				\
		--title "PERIGO, ISTO PODE DANIFICAR O SISTEMA"	\
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

################## RESTAURAR ARQUIVOS ##########################################

function MENU_RESTAURA {
	
	RESTAURA=$(
		$DIALOG							\
			--stdout					\
			--cancel-label "Voltar"				\
			--backtitle $btitle				\
			--title "RESTAURAR ARQUIVOS"			\
			--menu "\nO que deseja fazer?"			\
			0 0 0  						\
				1 "Restaurar /etc/rc.conf"		\
				2 "Restaurar /etc/pacman.conf"		\
				3 "Restaurar /etc/pacman.d/mirrorlist") ||
				MENUP

	case $RESTAURA in

		1)	REST_RCONF ;;
		
		2)	REST_PACMANCONF ;;
			
		3)	REST_MIRROR ;;

	esac
	
}

################ Desbloquear base de dados #####################################

MSG_DESTRAVA="\nTem certeza? Deseja desbloquear a base de dados agora?"

function DESTRAVA {
	
	$DIALOG						\
		--backtitle $btitle			\
		--title "DESBLOQUEAR BASE DE DADOS"	\
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
				--msgbox "A base de dados foi desbloqueada"  \
				08 30
			MENUO
	fi

}

############## MENU OUTRAS ATIVIDADES ##########################################
################################################################################

function MENUO {
	
	MENU_OUTROS=$(
		$DIALOG                  				\
			--stdout                               		\
			--cancel-label "Voltar"                		\
			--backtitle $btitle                    		\
			--title "OUTRAS ATIVIDADES"            		\
			--menu "O que deseja fazer?"			\
			0 0 0     					\
				1 "Limpar cache"			\
				2 "Detalhes de programas instalados"	\
				3 "Lista de pacotes perdidos"          	\
				4 "Editar /etc/rc.conf"                	\
				5 "Editar /etc/pacman.conf"            	\
				6 "Editar /etc/pacman.d/mirrorlist"	\
				7 "Restaurar arquivos"			\
				8 "Desbloquear base de dados") || MENUP
	
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



##################### MENU PRINCIPAL ###########################################
################################################################################

function MENUP {
	
	MENU=$(
		$DIALOG                       			\
			--stdout                             	\
			--backtitle $btitle                  	\
			--title "MENU PRINCIPAL"             	\
			--no-cancel                          	\
			--menu "\n       O que deseja fazer?"	\
			0 0 0					\
				1 "Instalar programa"		\
				2 "Instalar programa local"	\
				3 "Remover Programa"		\
				4 "Localizar Programa"		\
				5 "Atualizar Sistema"		\
				6 "Outras atividades"		\
				7 "Sobre este aplicativo"	\
				8 "Sair")
	
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
