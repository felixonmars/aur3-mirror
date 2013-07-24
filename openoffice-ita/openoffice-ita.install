#!/bin/bash

post_install() {
  ( ### freedesktop-menus postin (OOO 3.4)

update-desktop-database -q usr/share/applications

update-mime-database usr/share/mime

for theme in gnome hicolor locolor; do
if [ -e usr/share/icons/$theme/icon-theme.cache ] ; then
  touch usr/share/icons/$theme
  gtk-update-icon-cache -q usr/share/icons/$theme
  true
fi
done
  )
}

post_remove() {
  ( ### freedesktop-menus postun (OOO 3.4)
update-desktop-database -q

update-mime-database usr/share/mime

for theme in gnome hicolor locolor; do
if [ -e usr/share/icons/$theme/icon-theme.cache ] ; then
  touch usr/share/icons/$theme
  gtk-update-icon-cache -q usr/share/icons/$theme
  true
fi
done
  )
}

post_upgrade() {
  post_install "$1"
}
