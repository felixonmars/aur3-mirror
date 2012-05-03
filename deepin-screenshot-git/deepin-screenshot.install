#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

post_install() {
  ln -s /usr/share/deepin-screenshot/src/deepin-screenshot /usr/bin/deepin-screenshot
  ln -s /usr/share/deepin-screenshot/locale/en_US /usr/share/deepin-screenshot/locale/default
}

pre_update() {
  pre_remove $1
}

pre_remove() {
	if [ -d /usr/bin/deepin-screenshot ] ; then
    rm /usr/bin/deepin-screenshot
  fi
	if [ -d /usr/share/deepin-screenshot/locale/default ] ; then
    rm /usr/share/deepin-screenshot/locale/default
  fi
}
