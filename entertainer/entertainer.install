#!/bin/bash

post_install() {
  echo -n "Updating icon cache & desktop database..."
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
  echo " done."
}
 
post_upgrade() {
  echo -n "Updating icon cache..."
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  echo " done."
}
 
post_remove() {
  post_install
}
