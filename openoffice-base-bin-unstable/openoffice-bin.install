#!/bin/bash

# Inappropriate parts removed:
# - mime.type stuff is already provided by mime-types package
# - /etc/mailcap does not exist on ArchLinux normaly
# - Don't use 'which' because tools are already in depends

post_install() {
  local RPM_INSTALL_PREFIX='opt'

  ( ### freedesktop-menus postin (OOO 3.3)

update-desktop-database -q usr/share/applications

update-mime-database usr/share/mime

for theme in gnome hicolor locolor; do
if [ -e usr/share/icons/$theme/icon-theme.cache ] ; then
  # touch it, just in case we cannot find the binary...
  touch usr/share/icons/$theme
  gtk-update-icon-cache -q usr/share/icons/$theme
  # ignore errors (e.g. when there is a cache, but no index.theme)
  true
fi
done
  )

  ( ### ooo-dev3-dict-* postin
  
if [ -x "$RPM_INSTALL_PREFIX/ooo-dev3/program/unopkg" ]; then
  "$RPM_INSTALL_PREFIX/ooo-dev3/program/unopkg" sync 
  if [ "$?" != "0" ]; then
    echo "ERROR: Registration of extensions failed!"
    exit 1
  else
    echo "SUCCESS: unopkg returns successful!"
  fi
  find "$RPM_INSTALL_PREFIX/ooo-dev3/share/prereg/bundled" -type f -exec chmod 644 {} \;
fi

exit 0
  )

}

post_remove() {
  local RPM_INSTALL_PREFIX='opt'

  ( ### freedesktop-menus postun (OOO 3.3)
update-desktop-database -q usr/share/applications

update-mime-database usr/share/mime

for theme in gnome hicolor locolor; do
if [ -e usr/share/icons/$theme/icon-theme.cache ] ; then
  # touch it, just in case we cannot find the binary...
  touch usr/share/icons/$theme
  gtk-update-icon-cache -q usr/share/icons/$theme
  # ignore errors (e.g. when there is a cache, but no index.theme)
  true
fi
done
  )

  # In our case, this will do nothing. It's only here for reference.
  ( ### ooo-dev3-dict-* postun

if [ -x "$RPM_INSTALL_PREFIX/ooo-dev3/program/unopkg" ]; then
  "$RPM_INSTALL_PREFIX/ooo-dev3/program/unopkg" sync 
  if [ "$?" != "0" ]; then
    echo "ERROR: Registration of extensions failed!"
    exit 1
  else
    echo "SUCCESS: unopkg returns successful!"
  fi
  find "$RPM_INSTALL_PREFIX/ooo-dev3/share/prereg/bundled" -type f -exec chmod 644 {} \;
fi

exit 0
  )

}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
  post_install "$1"
}

# vim:set ts=2 sw=2 et:
