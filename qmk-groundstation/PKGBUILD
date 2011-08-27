# Contributor: Christian Hesse <mail@earthworm.de>
pkgname=qmk-groundstation
pkgver=1.0.1
pkgrel=1
pkgdesc="Mikrokopter Groundstation (like Kopter-Tool)"
arch=(x86_64)
url="http://www.mikrokopter.de/ucwiki/QMKGroundStation"
license=('GPL')
groups=()
depends=(qwt)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://svn.mikrokopter.de/filedetails.php?repname=Projects&path=%2FQMK-Groundstation%2FRelease%2FQMK-Groundstation-v1.0.1.tgz')
noextract=()
md5sums=(9b131ccbaebf6bfdd6c5aaf3094b0328)

build() {
  cd "$srcdir/QMK-Groundstation 1.0.1/"

  qmake suse.pro
  sed -i "s/#include <stdio.h>/#include <stdio.h>\n#include <stdint.h>/" SerialPort/posix_qextserialport.h
  make || return 1
  mkdir -p $pkgdir/usr/bin/
  install build/bin/QMK-Groundstation $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
