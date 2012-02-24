# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=brettspielwelt
pkgver=1.0
pkgrel=1
pkgdesc="Java client for BrettspielWelt: an online board games portal"
arch=('any')
url="http://www.brettspielwelt.de"
license=('Unknown')
provides=('brettspielwelt')
replaces=()
backup=()
options=()
install=.install
changelog=
source=(http://brettspielwelt.de/Data/$pkgname.tar.gz)
noextract=()
md5sums=('ff84636e2fe8e7d8a28e07fb51585bf0')


package() {
  cd "$srcdir/BrettspielWelt"
  mkdir --parent $pkgdir/usr/share/brettspielwelt
  cp -r * $pkgdir/usr/share/brettspielwelt
  chgrp -R games $pkgdir/usr/share/brettspielwelt
  mkdir --parent $pkgdir/usr/bin
  echo "#!/bin/bash" >> $pkgdir/usr/bin/brettspielwelt
  echo 'bash /usr/share/brettspielwelt/start.sh' >> $pkgdir/usr/bin/brettspielwelt
  chmod +x $pkgdir/usr/bin/brettspielwelt
  chmod -R g+rwx $pkgdir/usr/share/brettspielwelt 
}

# vim:set ts=2 sw=2 et:
