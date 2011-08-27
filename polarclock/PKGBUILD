# Maintainer: totoloco <totoloco at ushcompu dot com dot ar>

pkgname=polarclock
pkgver=20100302
pkgrel=1
pkgdesc="a polar clock based on gtk+. git master bz2 version"
arch=('i686' 'x86_64')
url="http://www.hinz.fdns.net/pclock-a-polar-clock-for-x11.html"
license=('GPL')
depends=('gtk2')
source=(http://www.hinz.fdns.net/cgit/cgit/polarclock/snapshot/$pkgname-master.tar.bz2)
md5sums=('39fc6ee98558ef60dde4cb11f2badfab')

build() {
  cd "$srcdir/$pkgname-master"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-master"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
