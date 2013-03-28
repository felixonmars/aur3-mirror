# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
pkgname=libguac-client-vnc
pkgver=0.7.1
pkgrel=1
pkgdesc="VNC client for the Guacamole web application"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net"
license=('GPL3')
depends=('libguac' 'libvncserver')
makedepends=()
optdepends=()
provides=()
source=(http://sourceforge.net/projects/guacamole/files/current/source/$pkgname-$pkgver.tar.gz)
md5sums=('cdef421458f30cd89fea4a986b6d0188')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
