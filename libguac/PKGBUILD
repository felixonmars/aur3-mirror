# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
pkgname=libguac
pkgver=0.7.0
pkgrel=2
pkgdesc="Library for the Guacamole web application"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/guacamole/"
license=('GPL3')
depends=('cairo')
makedepends=()
optdepends=()
provides=()
conflicts=()
source=(http://sourceforge.net/projects/guacamole/files/current/source/$pkgname-$pkgver.tar.gz)
md5sums=('cdb32abf694e0bc2de6cf329a378a1d6')

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
