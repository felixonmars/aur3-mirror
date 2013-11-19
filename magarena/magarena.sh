#!/bin/sh

# Magarena Start Script for Arch Linux supplied with Package

if [ ! -d "$HOME/.magarena" ]; then
  echo "--> Installing Magarena Base in your HOME..."
  mkdir $HOME/.magarena
  cp -r /usr/share/magarena-base/. $HOME/.magarena/
fi

CP=$CP:/usr/share/java/magarena/magarena.jar
CP=$CP:/usr/share/groovy/embeddable/groovy-all.jar
exec "$JAVA_HOME/bin/java" -Xms256M -Xmx256M -Dmagarena.dir=$HOME/.magarena -cp $CP magic.MagicMain
