#!/bin/sh
if [ ! -d $HOME/.voidlauncher ]; then
mkdir -p $HOME/.voidlauncher
fi

if [ ! -f $HOME/.voidlauncher/VoidLauncher.jar ]; then
cp /usr/share/voidlauncher/VoidLauncher.jar $HOME/.voidlauncher/VoidLauncher.jar
fi

if [ -f $HOME/.voidlauncher/VoidLauncher.jar ]; then
exec java -jar $HOME/.voidlauncher/VoidLauncher.jar
else
exec java -jar /usr/share/voidlauncher/VoidLauncher.jar
fi
