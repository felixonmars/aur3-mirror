#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

post_install() {
  ln -s /usr/share/deepin-scrot/src/deepin-scrot /usr/bin/deepin-scrot
  ln -s /usr/share/deepin-scrot/locale/en_US /usr/share/deepin-scrot/locale/default
}

pre_update(){
  pre_remove $1
}
pre_remove() {
	if [ -d /usr/bin/deepin-scrot ] ; then
    rm /usr/bin/deepin-scrot
  fi
	if [ -d /usr/share/deepin-scrot/locale/default ] ; then
    rm /usr/share/deepin-scrot/locale/default
  fi
}
