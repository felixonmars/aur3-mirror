#!/bin/bash

# This script replicates the Doukutsu working folder in a specified directory
# (defaults to ~/.doukutsu) by creating symbolic links to the installed
# files. This allows the game to store saves and configuration files
# without write permissions in the install folder and lets every user on 
# system keep their own saves/settings. It then launches the game or
# configuration tool.

INSTALLDIR=/usr/share/doukutsu-wine
USERDATADIR=$HOME/.doukutsu-wine

function create_structure {
rm -rf $USERDATADIR
mkdir -p $USERDATADIR
ln -s -t $USERDATADIR $INSTALLDIR/{Doukutsu.exe,DoConfig.exe,data} 
cd $USERDATADIR
}

function integrity_check {
USERFILECOUNT=`find $USERDATADIR -maxdepth 1 | grep -v Profile.dat | grep -v error.log | grep -v Config.dat | grep -v window.rect | wc -l`
SYSTEMFILECOUNT=`find $INSTALLDIR -maxdepth 1 | grep -v Profile.dat | grep -v error.log | grep -v Config.dat | wc -l` 
if [ $USERFILECOUNT != $SYSTEMFILECOUNT ]; then create_structure; fi
}

while getopts "ch" options; do
    case $options in
        c)
            integrity_check
            cd $USERDATADIR
            WINEDEBUG=-all wine $USERDATADIR/DoConfig.exe "$@"
            exit 0;;
        h|*)
            printf "Usage: doukutsu-wine [-h] [-c]\n"
            exit 0;;
    esac
done

if [ -d $USERDATADIR ]; then
    integrity_check
    cd $USERDATADIR
    WINEDEBUG=-all wine $USERDATADIR/Doukutsu.exe "$@"
else
    create_structure
    WINEDEBUG=-all wine /usr/share/doukutsu-wine/Doukutsu.exe "$@"
fi
