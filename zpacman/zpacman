#!/bin/bash
#
# #############################################################################################################
#
# Nome: ZPacman
#
# Versão: 2010.06
#
# Descrição: Uma interface simples, usando shell sript e zenity, para o pacman.
#            Gerenciador de pacotes do Archlinux. Este programa foi baseado nos 
#            códigos do "PacGUI", criado por "jorchube". Obrigado! "jorchube".
# 
# Autor: smarch < silveriomm@bol.com.br >
#
# Data: 02/06/2010
#
# #############################################################################################################
#

	mkdir -p $HOME/.zpacman

TERMINAL=gnome-terminal

################ SOBRE ########################################################################################
###############################################################################################################

function sobre {
	msg="ZPacman, é uma interface gráfica,
baseada em Zenity, para o pacman,
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
	
	zenity                        \
	--info                        \
	--title="Sobre o ZPacman..."  \
	--text="$msg"
	menu
}

# ################### MENU PRINCIPAL ##########################################################################
###############################################################################################################

function menu {
	MENU=$(zenity --list                                                                                     \
	--title="ZPacman 2010.06"                                                                                \
	--text="\n                            MENU PRINCIPAL\n\n\n               Selecione a operação desejada"  \
	--height=300 --width=350                                                                                 \
	--column="" --column=""                                                                                  \
	--hide-header                                                                                            \
	"1" " Instalar programa"                                                                                 \
	"2" " Remover programa"                                                                                  \
	"3" " Localizar programa"                                                                                \
	"4" " Atualizar sistema"                                                                                 \
	"5" " Outras operações"                                                                                  \
	"6" " Sobre este aplicativo...")

case $MENU in

1) menu_instalar ;;
2) menu_remover ;;
3) localiza ;;
4) menu_atualiza ;;
5) menu_outros ;;
6) sobre ;;

esac
}

##################### INSTALAR ################################################################################
###############################################################################################################

function menu_instalar {
	instalar=$(zenity --list                                               \
	--title="Instalar"                                                     \
	--width=450                                                            \
	--height=200                                                           \
	--column="Comando"                                                     \
	--column="Ação"                                                        \
	--text="                              Escolha a operação desejada\n"   \
	"S" "Instalar programa pelo repositório"                               \
	"U" "Instalar programa local"                                          \
	"Ss_S" "Procurar e instalar programa pelo repositório") || menu
	
	case $instalar in
	
S) instala ;;
U) instala_local ;;
Ss_S) busca_instala ;;

esac
}

# ----------------- Instalar programa pelo repositório --------------------------------------------------------

function instala {
	INSTALA=$(zenity                                                   \
	--entry                                                            \
	--title="Instalar programa pelo repositório"                       \
	--width=350                                                        \
	--text="Digite o nome (ou nomes) dos programas que deseja instalar")

if [ $? = 1 ]
	then
		menu_instalar
	else
		$TERMINAL -t "Instalando programa" -x sudo pacman -S $INSTALA
		menu_instalar
fi
}

# ------------- Instalar programa local -----------------------------------------------------------------------

function instala_local {
	local=$(zenity                                   \
	--file-selection                                 \
	--title="Selecione o arquivo que deseja instalar")
	
if [ $? = 1 ]
	then
		menu_instalar
	else
		$TERMINAL -t "Instalar programa local" -x sudo pacman -U $local
		menu_instalar
fi
}

# -------------- Localizar e instalar programa  ---------------------------------------------------------------

function busca_instala {
	BUSCA=$(zenity --entry                                                          \
	--title="Pesquisar no repositório"                                              \
	--width=400                                                                     \
	--text="Digite uma palavra-chave, ou o nome de um programa que deseja encontrar")
	
if [ $? = 1 ]
	then
		menu_instalar
	else
		RESP_BUSCA=$(pacman -Ss $BUSCA)
		RESP_BUSCA_SORT=$(echo $RESP_BUSCA | grep / | tr -s [:blank:] "\n" | grep / | tr -s "/" " ")
		
		PEGAR=$(zenity --list                                 \
		--checklist                                           \
		--title="Resultados encontrados para:  $BUSCA "       \
		--text="Selecione os programas que deseja instalar"   \
		--width=500 --height=500                              \
		--column=Instalar                                     \
		--column=Pacote $RESP_BUSCA_SORT)
if [ $? = 1 ]
	then
		menu_instalar
	else
	    PEGAR_INSTALAR=$(echo $PEGAR | tr "|" " ")
		$TERMINAL -t "Instalando programa" -x sudo pacman -S $PEGAR_INSTALAR
		menu_instalar			
fi
fi
}

##################### REMOVER PROGRAMA ########################################################################
###############################################################################################################

function menu_remover {
	MENU_REMOVER=$(zenity --list                            \
	--title="Remover programa"                              \
	--hide-header                                           \
	--width=350                                             \
	--height=200                                            \
	--column=""                                             \
	--column="Opções"                                       \
	--text="                 Escolha a operação desejada"   \
	"1" "Remover programa"                                  \
	"2" "Localizar e remover programa") || menu
	
	case $MENU_REMOVER in
	
1) remover ;; 
2) busca_remove ;;

esac
}

# -------------------- Remover programa -----------------------------------------------------------------------

function remover {
	REMOVER=$(zenity                                                  \
	--entry                                                           \
	--title="Remover programa"                                        \
	--width=350                                                       \
	--text="Digite o nome (ou nomes) dos programas que deseja remover")
	
if [ $? = 1 ]
	then
		menu_remover		
	else
		$TERMINAL -t "Remover programa" -x sudo pacman -Rsc $REMOVER
		menu_remover
fi	
}

# -------------- Localizar e remover programa -----------------------------------------------------------------

function busca_remove {
	BUSCA=$(zenity --entry                                                        \
	--title="Pesquisar no repositório"                                            \
	--width=400                                                                   \
	--text="Digite uma palavra-chave, ou o nome de um programa que deseja remover")
	
if [ $? = 1 ]
	then
		menu_remover	    
	else
		RESP_BUSCA=$(pacman -Ss $BUSCA)
		RESP_BUSCA_SORT=$(echo $RESP_BUSCA | grep / | tr -s [:blank:] "\n" | grep / | tr -s "/" " ")
				
		PEGAR=$(zenity --list                               \
		--checklist                                         \
		--title="Resultados encontrados para:  $BUSCA  "    \
		--text="Selecione os programas que deseja remover"	\
		--width=350 --height=500                            \
		--column=Instalar                                   \
		--column=Pacote $RESP_BUSCA_SORT)
if [ $? = 1 ]
	then
		menu_remover
	else
	    PEGAR_REMOVER=$(echo $PEGAR | tr "|" " ")
		$TERMINAL -t "Localizar e remover programa" -x sudo pacman -Rsc $PEGAR_REMOVER
		menu_remover
fi
fi
}

################### LOCALIZAR PROGRAMA ########################################################################
###############################################################################################################

function localiza {
	localiza=$(zenity                                                            \
	--entry                                                                      \
	--title="Localizar programa"                                                 \
	--width=350                                                                  \
	--text="Digite uma palavra-chave, ou o nome do programa que deseja encontrar")
	
if [ $? = 1 ]
	then
		menu
	else
	    resp_localiza=$(pacman -Ss $localiza)
	
		echo "$resp_localiza" |
		zenity --text-info                                \
		--width=500 --height=500                          \
		--title="Resultados encontrados para:  $localiza  "
		menu
fi
}

#################### ATUALIZAR SISTEMA ########################################################################
###############################################################################################################

function menu_atualiza {
	atualiza=$(zenity                                              \
	--list                                                         \
	--title="Atualizar sistema"                                    \
	--width=400                                                    \
	--height=200                                                   \
	--column="Comando"                                             \
	--column="Ação"                                                \
	--text="                        Escolha a operação desejada"   \
	"Syu" "Atualizar sistema"                                      \
	"Sy" "Atualizar somente a base de dados"                       \
	"Syy" "Forçar a atualização da base de dados") || menu
	
	case $atualiza in
	
Syu) $TERMINAL -t "Atualizando sistema" -x sudo pacman -Syu
	 menu ;;
	 
Sy) $TERMINAL -t "Atualizando base de dados" -x sudo pacman -Sy
	 menu ;;
	 
Syy) $TERMINAL -t "Atualizando base de dados" -x sudo pacman -Syy
	 menu ;;
esac
}

################## OUTRAS OPERAÇÕES ###########################################################################
###############################################################################################################

function menu_outros {
	MENU_OUTROS=$(zenity --list                             \
	--title="Outras operações"                              \
	--text="                 Escolha a operação desejada"   \
	--hide-header                                           \
	--width=350                                             \
	--height=300                                            \
	--column=""                                             \
	--column="Opções"                                       \
	"1" "Limpar cache"                                      \
	"2" "Informações de programas instalados"               \
	"3" "Lista de pacotes orfãos"                           \
	"4" "Criar e instalar pacote"                           \
	"5" "Editar /etc/rc.conf"                               \
	"6" "Editar /etc/pacman.conf"                           \
	"7" "Editar /etc/pacman.d/mirrorlist"	                \
	"8" "Restaurar arquivos"                                \
	"9" "Desbloquear base de dados") || menu
	
	case $MENU_OUTROS in
	
1) limpar ;;
2) info ;;
3) lista ;;
4) makepkg ;;
5) rcconf ;;
6) pacconf ;;
7) mirror ;;
8) menu_restaura ;;
9) destrava ;;
esac 
}

# ------------- Limpar cache ----------------------------------------------------------------------------------

function limpar {
	LIMPAR=$(zenity                                             \
	--list                                                      \
	--title="Limpar cache"                                      \
	--text="                     Escolha a operação desejada"   \
	--width=380                                                 \
	--height=170                                                \
	--column="Comando"                                          \
	--column="Ação"                                             \
	"Sc" "Limpar pacotes antigos do cache"                      \
	"Scc" "Apagar todos os pacotes do cache") || menu_outros
	
	case $LIMPAR in
	
Sc) $TERMINAL -t "Limpando cache" -x sudo pacman -Sc
	menu_outros ;;
Scc) $TERMINAL -t "Limpando cache" -x sudo pacman -Scc
	menu_outros ;;

esac
}

# ----------- Informações de programas instalados -------------------------------------------------------------

function info {
	INFO=$(zenity                                                                \
	--entry                                                                      \
	--title="Informações de programas instalados"                                \
	--text="Digite o nome do programa, para saber mais informações sobre o mesmo")
	
if [ $? = 1 ]
	then
		menu_outros
	else
		RESP_INFO=$(pacman -Qi $INFO)
		echo "$RESP_INFO" |
		zenity --text-info                       \
		--width=500 --height=500                 \
		--title="Informações do programa:  $INFO "
		menu_outros		
fi
}

# --------------- Lista de pacotes orfãos ---------------------------------------------------------------------

function lista {
	pacman -Qdt | zenity --title="Lista de pacotes orfãos" --text-info
	menu_outros
}

# ------------ Criar e instalar pacote ------------------------------------------------------------------------

function makepkg {
	PKGDIR=$(zenity                                                        \
	--file-selection                                                       \
	--directory                                                            \
	--title="Selecione o diretório onde o arquivo PKGBUILD está localizado")
	
if [ $? = 1 ]
	then
		menu_outros
	else
		$TERMINAL -t "Criar e instalar pacote" --working-directory=$PKGDIR -x makepkg -s
if [ ! $(ls $PKGDIR | grep pkg.tar.xz) ]
	then
		zenity                                                          \
		--error                                                         \
		--title="Criar e instalar pacote"                               \
		--text="Hove um erro ao criar o pacote, nenhum pacote foi criado"
	else
		zenity                                          \
		--question                                      \
		--title="Criar e instalar pacote"               \
		--text="Você gostaria de instalar o novo pacote?"
if [ $? = 1 ]
	then
		menu_outros
	else
		$TERMINAL -t "Criar e instalar pacote" -x sudo pacman -U $PKGDIR/*.pkg.tar.xz
		zenity --info                                      \
		--title="Criar e instalar pacote"                  \
		--text="O Pacote foi criado e instalado com sucesso"
		menu_outros
fi
fi
fi
}

# ------------ Editar /etc/rc.conf  --------------------------------------------------------------------------------

function rcconf {
	RCCONF=$(zenity                                           \
	--question                                                \
	--width=400                                               \
	--title="ATENÇÃO! ISTO PODE DANIFICAR O SISTEMA!"         \
	--text="Tem certeza? Editar o arquivo /etc/rc.conf agora?")

if [ $? = 1 ] 
	then
		menu_outros
	else
		cp /etc/rc.conf $HOME/.zpacman/rc.conf.backup &&
		gksu gedit /etc/rc.conf
			zenity                                                      \
			--title="Editar /etc/rc.conf"                               \
			--info                                                      \
			--text="O Arquivo /etc/rc.conf\n foi modificado com sucesso!"
	menu_outros
fi
}

# ------------ Editar /etc/pacman.conf  ----------------------------------------------------------------------------

function pacconf {
	PACCONF=$(zenity                                              \
	--question                                                    \
	--width=400                                                   \
	--title="ATENÇÃO! ISTO PODE DANIFICAR O SISTEMA!"             \
	--text="Tem certeza? Editar o arquivo /etc/pacman.conf agora?")

if [ $? = 1 ] 
	then
		menu_outros
	else
		cp /etc/pacman.conf $HOME/.zpacman/pacman.conf.backup &&
		gksu gedit /etc/pacman.conf
			zenity                                                          \
			--title="Editar /etc/pacman.conf"                               \
			--info                                                          \
			--text="O Arquivo /etc/pacman.conf\n foi modificado com sucesso!"
	menu_outros
fi
}

# ------------ Editar /etc/pacman.d/mirrorlist  ---------------------------------------------------------------

function mirror {
	MIRROR=$(zenity                                                       \
	--question                                                            \
	--width=400                                                           \
	--title="ATENÇÃO! ISTO PODE DANIFICAR O SISTEMA!"                     \
	--text="Tem certeza? Editar o Arquivo /etc/pacman.d/mirrorlist agora?")

if [ $? = 1 ] 
	then
		menu_outros
	else
		cp /etc/pacman.d/mirrorlist $HOME/.zpacman/mirrorlist.backup &&
		gksu gedit /etc/pacman.d/mirrorlist
			zenity                                                                  \
			--title="Editar /etc/pacman.d/mirrorlist"                               \
			--info                                                                  \
			--text="O Arquivo /etc/pacman.d/mirrorlist\n foi modificado com sucesso!"
	menu_outros
fi
}

# ------------------- Restaurar arquivos ----------------------------------------------------------------------

function menu_restaura {
	MENU_RESTAURA=$(zenity --list                     \
	--title="Restaurar arquivos"                      \
	--text="           Escolha a operação desejada"   \
	--hide-header                                     \
	--width=300                                       \
	--height=150                                      \
	--column=""                                       \
	--column="Opções"                                 \
	"1" "Restaurar /etc/rc.conf"                      \
	"2" "Restaurar /etc/pacman.conf"                  \
	"3" "Restaurar /etc/pacman.d/mirrorlist") || menu_outros

case $MENU_RESTAURA in

1) rest_rconf ;;
2)  rest_pacmanconf ;;	
3)  rest_mirror ;;

esac
}

# ------------ Restaurar /etc/rc.conf -------------------------------------------------------------------------

function rest_rconf {
	REST_RCONF=$(zenity                                                    \
	--question                                                             \
	--width=400                                                            \
	--title="Restaurar arquivo /etc/rc.conf"                               \
	--text="Tem certeza? Você quer restaurar o arquivo /etc/rc.conf agora?")
	
if [ $? = 1 ]
	then
		menu_restaura
	else
		gksu cp $HOME/.zpacman/rc.conf.backup /etc/rc.conf
		zenity --info --title="Restaurar arquivo" --text="O arquivo /etc/rc.conf foi restaurado\ncom sucesso"
		menu_restaura 
fi
}

# ------------------------ Restaurar /etc/pacman.conf ---------------------------------------------------------

function rest_pacmanconf {
	REST_PACMANCONF=$(zenity                                                   \
	--question                                                                 \
	--width=400                                                                \
	--title="Restaurar arquivo /etc/pacman.conf"                               \
	--text="Tem certeza? Você Quer Restaurar o Arquivo\n /etc/pacman.conf agora?")
	
if [ $? = 1 ]
	then
		menu_restaura
	else
		gksu cp $HOME/.zpacman/pacman.conf.backup /etc/pacman.conf
		zenity --info --title="Restaurar arquivo" --text="O arquivo /etc/pacman.conf foi restaurado\ncom sucesso"
		menu_restaura
fi
}

# ------------------------ Restaurar /etc/pacman.d/mirrorlist -------------------------------------------------

function rest_mirror {
	zenity                                                                              \
	--question                                                                          \
	--width=400                                                                         \
	--title="Restaurar Arquivo /etc/pacman.d/mirrorlist"                                \
	--text="Tem certeza? Você Quer Restaurar\no Arquivo /etc/pacman.d/mirrorlist Agora?"
	
if [ $? = 1 ]
	then
		menu_restaura
	else
		gksu cp $HOME/.zpacman/mirrorlist.backup /etc/pacman.d/mirrorlist
		zenity --info --title="Restaurar Arquivo" --text="O arquivo /etc/pacman.d/mirrorlist\nfoi restaurado com sucesso"
		menu_restaura
fi
}

# -------------- Desbloquear base de dados --------------------------------------------------------------------

function destrava {
	zenity --question                                     \
	--title="Desbloquear base de dados"                   \
	--text="Gostaria de desbloquear a base de dados agora?"
	
if [ $? = 1 ]
	then
		menu_outros	
	else
		gksu rm /var/lib/pacman/db.lck
		zenity --info --title="Desbloquear base de dados" --text="A base de dados foi desbloqueada"
		menu_outros
fi
}

menu


