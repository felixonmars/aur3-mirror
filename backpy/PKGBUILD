# Maintainer: Steffen Schneider <stes94@ymail.com>
pkgname=backpy
pkgver=1.0
pkgrel=1
pkgdesc="A simple backup utility written in python"
arch=(any)
url="https://github.com/stes/backpy"
license=('Simplified BSD')
groups=()
depends=(python2)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
source=(https://github.com/downloads/stes/backpy/backpy.tar.gz)
changelog=
noextract=()
md5sums=('9776931a20417633e532b53544f6dd60')

build() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/man/man1
  install ./backpy.py ${pkgdir}/usr/bin/backpy
  install ./backpy.man ${pkgdir}/usr/share/man/man1/backpy.1
}
