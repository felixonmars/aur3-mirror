#!/bin/sh

# Magarena Start Script for Arch Linux supplied with AUR

rebase() {
  echo -e "\033[1m ==> Updating Magarena Base...\033[0m"
  echo -e
  cp -rfp /usr/share/magarena-base/. $HOME/.magarena/
}

# check if user needs update
if [ ! -d "$HOME/.magarena" ]; then
    mkdir $HOME/.magarena
    rebase
elif [ "$1" == "rebase" ]; then
    rebase
elif ! diff /usr/share/magarena-base/Magarena/VERSION $HOME/.magarena/Magarena/VERSION >/dev/null 2>&1; then
    rebase
fi

# this is needed to get Readme.txt to work
cd $HOME/.magarena/Magarena

CP=$CP:/usr/share/java/magarena/magarena.jar
CP=$CP:/usr/share/groovy/embeddable/groovy-all.jar
exec "$JAVA_HOME/bin/java" -Xms256M -Xmx512M -Dmagarena.dir=$HOME/.magarena -cp $CP magic.MagicMain
