# Maintainer: Andreas Krinke <andreas.krinke@gmx.de>
pkgname=companion9x-svn
_svnname=companion9x
pkgver=2006
pkgrel=1
pkgdesc="EEPROM Editor for open source 9X RC transmitter firmwares"
arch=('i686' 'x86_64')
url="http://companion9x.googlecode.com"
license=('GPL')
depends=('phonon' 'qt4' 'sdl' 'xerces-c')
makedepends=('subversion' 'cmake' 'xsd')
provides=('companion9x')
conflicts=('companion9x')
source=('companion9x::svn+http://companion9x.googlecode.com/svn/trunk')
md5sums=('SKIP')

pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

build() {
  cd $_svnname
  mkdir lbuild
  cd lbuild
  cmake ../src
  make clean
  make
}

package() {
  cd $_svnname
  install -Dm755 lbuild/companion9x "$pkgdir/usr/bin/companion9x"
  install -Dm644 src/companion9x.desktop "$pkgdir/usr/share/applications/companion9x.desktop"
  install -Dm644 src/companion9x.png "$pkgdir/usr/share/icons/companion9x.png"
}

# vim:set ts=2 sw=2 et:
