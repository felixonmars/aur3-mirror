#!/bin/sh

pacman -Qi >./all_files

if [ -z "$1" ] ; then
   echo -e "\033[0;37mNo repo given!"
   echo " usage: scriptname reponame"
fi

reponame=$1
list=$1_list
pacman -Sl $reponame >./$list
sed -i "s|\$reponame |g|" ./$list
repo=`cat ./$list | cut --fields 2 --delim " "`

for pkg in $repo ; do
   if [[ $(cat ./all_files | grep -w "$pkg") ]] ; then
      echo -e "\033[0;34m$pkg\033[0;37m is installed"
      echo "$pkg" >>./installed_files
   elif [ "$2" == "all" ] ; then
      echo -e "\033[0;31m$pkg\033[0;37m is NOT installed"
   fi
done

echo
echo -n "Would you like to save the names of these pkgs to a file? (Y/n) "
read choice
if [ "$choice" == "Y" -o  "$choice" == "y" ] ; then
   echo "Currently in `pwd`"
   echo -n "   Save as: "
   read filename
   if [ -z $filename ] ; then
      echo "No name given saved as ./installed_files_$reponame"
      cp -u ./installed_files ./installed_files_$reponame
   else
      cp -u ./installed_files $filename
   fi
   rm ./installed_files
else
   rm ./installed_files
fi
rm ./$list ./all_files
