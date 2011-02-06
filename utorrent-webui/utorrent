#!/bin/bash

if [ ! -d "$HOME"/.utorrent ] ; then
  mkdir "$HOME"/.utorrent || exit 1
  cp /usr/share/utorrent/settings.dat "$HOME"/.utorrent || exit 1
fi

if [ ! -e "$HOME"/.utorrent/utorrent ] ; then
  ln -s /usr/share/utorrent/utorrent.exe "$HOME"/.utorrent/utorrent || exit 1
fi

if [ ! -e "$HOME"/.utorrent/webui.zip ] ; then
  ln -s /usr/share/utorrent/webui.zip "$HOME"/.utorrent/webui.zip || exit 1
fi

if [ ! -d "$HOME"/.utorrent/sortabletable ] ; then
  ln -s /usr/share/utorrent/sortabletable "$HOME"/.utorrent/sortabletable || exit 1
fi

wine "$HOME"/.utorrent/utorrent $*

