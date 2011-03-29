#!/bin/bash
# Created By: Alessio Di Paolosanti
# E-Mail: a.dipaolosanti@gmail.com
# Set Var
DATA=$(date '+%d-%m-%Y')
BLUE="\033[7;34m"
RED="\033[0;31m"
LRED="\033[7;31m"
RED="\033[3;31m"
WHI="\033[1;37m"
NC="\033[0m"
# Start Script
clear
echo -e "$BLUE                         ..::ArchLinux::..                         $NC"
echo -e ""
echo -e "__     __                    _           _____       _    __ "
echo -e "\ \   / /                   | |         / ____|     (_)  /_ |"
echo -e " \ \_/ /_ _  ___  _   _ _ __| |_ ______| |  __ _   _ _    | |"
echo -e "  \   / _  |/ _ \| | | |  __| __|______| | |_ | | | | |   | |"
echo -e "   | | (_| | (_) | |_| | |  | |_       | |__| | |_| | |   | |"
echo -e "   |_|\__,_|\___/ \__,_|_|   \__|       \_____|\__,_|_|   |_|"
echo -e ""
echo -e "$BLUE             YAOURT-GUI 1.4b IT-EN - Created by A.D.P.             $NC"
echo -e ""
echo -e "$LRED !!!WARNING!!! $RED Do not install without the dependencies$NC"
echo -e "$RED Required:$NC sudo, yaourt"
echo -e ""
OPTIONS="Install_IT Install_EN Readme Help Quit"
select opt in $OPTIONS; do
if [ "$opt" = "Quit" ]; then
	echo -e "$RED Do you really want exit? y/n $NC"
	read SNE
if [ $SNE = y ]; then
	clear
	echo -e "$BLUE             YAOURT-GUI 1.4b IT-EN - Created by A.D.P.             $NC"
	exit
else
	clear
	echo -e "$BLUE Press ENTER to display the Menu $NC"
fi
## readme file ###
elif [ "$opt" = "Readme" ]; then
	clear
	more README
	echo -e ""
	echo -e "Press ENTER to display the Menu"
## install yaourt-gui IT ####
elif [ "$opt" = "Install_IT" ]; then 
	tar xvfz bin.tar.gz
	sudo cp bin/it/yaourt-gui /usr/bin
	sudo chmod 777 /usr/bin/yaourt-gui
	sudo chmod +x /usr/bin/yaourt-gui
	sudo cp bin/it/yaourtproxy /usr/bin
	sudo chmod 777 /usr/bin/yaourtproxy
	sudo chmod +x /usr/bin/yaourtproxy
	rm -rf bin/
	clear
	echo -e "$BLUE ..:: YAOURT-GUI INSTALLED ::.. $NC"
	echo -e "Quit and run yaourt-gui to terminal"
	echo -e ""
	echo -e "Press ENTER to display the Menu"
## install yaourt-gui EN ####
elif [ "$opt" = "Install_EN" ]; then 
	tar xvfz bin.tar.gz
	sudo cp bin/en/yaourt-gui /usr/bin
	sudo chmod 777 /usr/bin/yaourt-gui
	sudo chmod +x /usr/bin/yaourt-gui
	sudo cp bin/en/yaourtproxy /usr/bin
	sudo chmod 777 /usr/bin/yaourtproxy
	sudo chmod +x /usr/bin/yaourtproxy
	rm -rf bin/
	clear
	echo -e "$BLUE ..:: YAOURT-GUI INSTALLED ::.. $NC"
	echo -e "Quit and run yaourt-gui to terminal"
	echo -e ""
	echo -e "Press ENTER to display the Menu"
### Help ###
elif [ "$opt" = "Help" ]; then
	clear
	echo -e ""
	echo -e "$BLUE GUIDE USE SCRIPT $NC"
	echo -e ""
	echo -e "* Press$RED 1$NC to install Yaourt-Gui ITALIANO"
	echo -e "* Press$RED 2$NC to install Yaourt-Gui ENGLISH"
	echo -e "* Press$RED 3$NC to see file Readme"
	echo -e "* Press$RED 4$NC to see this menu"
	echo -e "* Press$RED 5$NC to exit the script"
	echo -e ""
### error ###
else
	clear
	echo -e ""
	echo -e "$LRED !!!WARNING!!! Unknown command!! $NC"
	echo -e "$RED press ENTER to display the Menu$NC"
fi
done
### end script ###
