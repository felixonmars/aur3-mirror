#!/bin/sh

GCC_VERSION=4.5.1
INSTALL_PATH="/usr"

clean() {
    cd "$INSTALL_PATH/include/d/$GCC_VERSION/"
    rm -f object.d object.di std
}


case $1 in
tango)
    clean

    cd "$INSTALL_PATH/include/d/$GCC_VERSION/"
    ln -s object.di.tango object.di
    ;;

phobos)
    clean

    cd "$INSTALL_PATH/include/d/$GCC_VERSION/"
    ln -s object.d.phobos object.d
    ln -s std.phobos std
    ;;

status)
    cd "$INSTALL_PATH/include/d/$GCC_VERSION/"
    if [ -f object.d ]; then
        echo Phobos
    elif [ -f object.di ]; then
        echo Tango
    else
        echo Unknown
    fi
esac
