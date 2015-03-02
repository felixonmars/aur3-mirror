#!/bin/bash
# 15-Jan-2015: Modified the script so that it is NOT called via an alias
# with sudo su -c , the script now uses sudo internally.
# Options [2] & [3] now have the --noconfirm parameter added, try it,
# if you don't like it, then delete --noconfirm from the script.
# 22-May-2014: Changed the title name to allservers . (Big change huh?)
# 20-November-2013: Removed stuff from the menu that really next to
# no one needs to see. The menu just does its job now, nothing more or less.
#
# 17-November-2013: I've finally felt like spending the time to improve
# (imho) the colours of the menu & I've also refined it some.
#
# 10-July-2013: Now using pkgCacheClean instead of CacheClean. It uses
# pacman's version checking method.
#
# 11-June-2013: Made Option 1. available (it is useful on the odd occasion).
# Made the display more informative during the progress of each option.
#
# 13-May-2013: Removed the ability for Option 1. to be run standalone, 
# due to having been told to read this:
# https://wiki.archlinux.org/index.php/Pacman#Partial_upgrades_are_unsupported 
#
# 27-April-2013: Updated to use the new pacman-mirrors -g to rankmirrors. 
#
# allservers.sh - inspired by Manjaro's Carl & Phil, initially hung together 
# by handy, the script's display prettied up & progress information added by Phil, 
# the menu & wiki page added by handy.
# Latest revision now calls everything via the menu.
# The following wiki page is about this script: 
# http://wiki.manjaro.org/index.php/Allservers.sh_Script:-_Rankmirrors,_Synchronise_Pacman_Database
# Following wiki page will introduce pkgCacheClean & related information:
# http://wiki.manjaro.org/index.php/Maintaining_/var/cache/pacman/pkg_for_System_Safety
#___________________________________________________________
# 
# allservers (I've dropped the .sh at the end) is now completely
# menu driven. The Menu describes what it does for you, if you
# need more detail see the two wiki page links listed above.
###########################################################

err() {
   ALL_OFF="\e[1;0m"
   BOLD="\e[1;1m"
   RED="${BOLD}\e[1;31m"
    local mesg=$1; shift
    printf "${RED}==>${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@" >&2
}

msg() {
   ALL_OFF="\e[1;0m"
   BOLD="\e[1;1m"
   GREEN="${BOLD}\e[1;32m"
    local mesg=$1; shift
    printf "${GREEN}==>${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@" >&2
}


## The following 5 lines are the now redundant test for root.
# if  [ "$EUID" != 0 ];
# then
#   err "Must use 'sudo su' before you run this script."
#   exit 1
# fi


# The menu:

clear # Clear the screen.

echo
echo -e "\e[1;32m                             allservers"
echo
echo -e " \e[0;33m   Enter Your chosen Option's number \e[0;32m[\e[1;37m?\e[0;32m] \e[4;37mOR\e[0m\e[0;32m hit \e[0;31mReturn\e[0;32m to \e[0;31mexit\e[0;32m. "
echo
echo
echo -e "    [\e[1;37m1\e[0;32m] Rank Mirrors & update mirrorlist: \033[0mpacman-mirrors -g" 
echo -e "       \e[0;33m &\e[0;32m then sync/refresh package lists: \033[0mpacman -Syy "
echo
echo -e "   \e[0;32m [\e[1;37m2\e[0;32m] Option 1. \e[0;33mplus\e[0;32m Upgrade the System: \033[0mpacman -Syu --noconfirm "
echo -e "       \e[0;33m &\e[0;32m then run pkgCacheClean: \033[0mpkgcacheclean "
echo
echo -e "   \e[0;32m [\e[1;37m3\e[0;32m] Option 1. \e[0;33mplus\e[0;32m Upgrade the System & AUR: \033[0myaourt -Syua --noconfirm "
echo -e "       \e[0;33m &\e[0;32m then run pkgCacheClean: \033[0mpkgcacheclean "
echo
echo -e "   \e[0;32m [\e[1;37m4\e[0;32m] Upgrade the System only: \033[0mpacman -Syu "
echo -e "       \e[0;33m &\e[0;32m then run pkgCacheClean: \033[0mpkgcacheclean "
echo
echo -e "   \e[0;32m [\e[1;37m5\e[0;32m] Upgrade the System & AUR only: \033[0myaourt -Syua "
echo -e "       \e[0;33m &\e[0;32m then run pkgCacheClean: \033[0mpkgcacheclean "
echo
echo 
echo -e "\033[1m  Enter the Number of Your Choice: \033[0m"
echo    

read option

case "$option" in
# Note variable is quoted.

 "1")
 echo
 msg "Processing mirrors:"
 echo
 sudo pacman-mirrors -g
 echo
 msg "Your mirrors have been ranked &"
 msg "the mirrorlist has now been refreshed."
 echo
 msg "Refreshing your pacman database:"
 sudo pacman -Syy
 echo
 msg "Your mirrors & package database are now synchronised."
 echo
 ;;
# Note double semicolon to terminate each option.

 "2")
 echo
 msg "Processing mirrors:"
 echo
 sudo pacman-mirrors -g
 echo
 msg "Your mirrors have been ranked &"
 msg "the mirrorlist has now been refreshed."
 echo
 msg "Refreshing your pacman database:"
 sudo pacman -Syy
 echo
 msg "Your mirrors & package database are now synchronised."
 echo
 msg "Upgrading System:"
 echo
 sudo pacman -Syu --noconfirm
 echo
 msg "System upgrade complete."
 echo
 msg "pkgCacheClean will now remove all but the 2 most "
 msg "recent versions of the installation packages in "
 msg "/var/cache/pacman/pkg directory:"
 echo
 sudo pkgcacheclean
 echo
 msg "pkgCacheClean has done its job. "
 echo
 ;;
# Note double semicolon to terminate each option.

 "3")
 echo
 msg "Processing mirrors:"
 echo
 sudo pacman-mirrors -g
 echo
 msg "Your mirrors have been ranked &"
 msg "the mirrorlist has now been refreshed."
 echo
 msg "Refreshing your pacman database:"
 sudo pacman -Syy
 echo
 msg "Your mirrors & package database are now synchronised."
 echo
 msg "Upgrading System & AUR:"
 echo
 yaourt -Syua --noconfirm
 echo
 msg "System including AUR packages are up to date."
 echo
 msg "pkgCacheClean will now remove all but the 2 most "
 msg "recent versions of the installation packages in "
 msg "/var/cache/pacman/pkg directory:"
 echo
 sudo pkgcacheclean
 echo
 msg "pkgCacheClean has done its job. "
 echo
 ;;
# Note double semicolon to terminate each option.

 "4")
 echo
 msg "Upgrading System:"
 echo
 sudo pacman -Syu
 echo
 msg "System update complete."
 echo
 msg "pkgCacheClean will now remove all but the 2 most "
 msg "recent versions of the installation packages in "
 msg "/var/cache/pacman/pkg directory:"
 echo
 sudo pkgcacheclean
 echo
 msg "pkgCacheClean has done its job. "
 echo
 ;;
# Note double semicolon to terminate each option.

 "5")
 echo
 msg "Upgrading System & AUR: "
 echo
 yaourt -Syua
 echo
 msg "System including AUR packages are up to date. "
 echo
 msg "pkgCacheClean will now remove all but the 2 most "
 msg "recent versions of the installation packages in "
 msg "/var/cache/pacman/pkg directory:"
 echo
 sudo pkgcacheclean
 echo
 msg "pkgCacheClean has done its job. "
 echo
 ;;
# Note double semicolon to terminate each option.

esac

exit 0
