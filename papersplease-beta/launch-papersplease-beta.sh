#!/bin/bash

# Assuming the script is under this dir
DIR="/opt/papersplease-beta"

prefixdir="$HOME/.papersplease-beta"
gamedir="$prefixdir/drive_c/dukope/papersplease"

if [[ $(uname -m) =~ x86_64 ]]
then
    export WINEARCH='win64'
else
    export WINEARCH='win32'
fi
export WINEPREFIX="$prefixdir"

launchgame() {
    cd "$gamedir"
    if ! [ "$?" -eq 0 ]
    then
        echo "ERROR: Couldn't cd into game working directory."
        echo "Examine '$gamedir'."
        echo "Delete '$prefixdir' and re-execute this script to recreate it."
        return 1
    fi

    # Run program, pass all arguments
    WINEDEBUG='fixme-all' wine ./PapersPlease.exe "$@"
    exitcode="$?"

    if ! [ "$exitcode" -eq 0 ]
    then
        echo "wine exited abnormally. It's possible that the WINEPREFIX needs to be recreated."
        echo "Delete '$prefixdir' and re-execute this script to recreate the WINEPREFIX dir."
        echo "Make sure to backup any saved games that directory contains before deleting it."
        return $exitcode
    fi
    return 0
}


createprefix() {
    # Set up basic stuff with wineboot
    echo ">>> wineboot"
    mkdir "$prefixdir"
    wineboot
    if ! [ "$?" -eq 0 ]
    then
        echo "wineboot exited abnormally. Can't create the wineprefix at '$prefixdir'."
        return 1
    fi

    # Prepare copies/symlinks of files required by the game
    mkdir -p "$gamedir"

    respath="$DIR/game"

    echo ">>> Game files"
    # Directory needs to be writeable
    mkdir "$gamedir/mods/"
    readonlyFiles=$(ls -1 "$respath/mods/")
    for file in $readonlyFiles
    do
        ln -s -T "$respath/mods/$file" "$gamedir/mods/$file"
    done

    # Files/subdirs that are only ever read
    readonlyFiles=$(ls -1 "$respath/" | grep -vE -e '^mods$')
    for file in $readonlyFiles
    do
        ln -s -T "$respath/$file" "$gamedir/$file"
    done
}


# Create the directory if it does not exist, then run the game.
if ! [ -d "$prefixdir" ]
then
    echo "Creating wineprefix for the game. This only needs to be done once, future runs will skip this step."
    # Don't continue if there's an error when creating the prefix
    createprefix || exit "$?"
    echo "Wineprefix creation complete, running the game."
fi

launchgame "$@"
exit "$?"
