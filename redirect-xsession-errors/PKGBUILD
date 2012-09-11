pkgname=redirect-xsession-errors
pkgver=2012.01.11
pkgrel=1
pkgdesc='Redirect $HOME/.xsession-errors to /dev/null.'
arch=(any)
url="http://askubuntu.com/questions/93718/how-do-i-prevent-xsession-errors-from-eating-disk-space"
license=("unknown")
depends=(sh)
         
package() {
  mkdir -p "$pkgdir/etc/X11/Xsession.d"
  echo '#!/bin/sh

# Redirect $HOME/.xsession-errors to /dev/null.
# BJEM 11 January 2012

XSESSION_ERRFILE=$HOME/.xsession-errors

# This does not seem to work for a regular file,
# i.e. if you want to symlink $HOME/.xsession-errors
# to another file.  I do not know why.
XSESSION_ERRFILE_FINAL=/dev/null

# Creates target file if it does not exist.
touch "$XSESSION_ERRFILE_FINAL"

# Link .xsession-errors file to the desired target
# no matter what.
ln -sf "$XSESSION_ERRFILE_FINAL" "$XSESSION_ERRFILE"

# Test case.
#gedit &

##### END OF FILE #####' >> "$pkgdir/etc/X11/Xsession.d/91redirect-xsession-errors"
  chmod +x "$pkgdir/etc/X11/Xsession.d/91redirect-xsession-errors"
}

# vim:set ts=2 sw=2 et:
