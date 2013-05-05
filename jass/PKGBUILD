# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=jass
pkgver=0.9.5
pkgrel=2
pkgdesc="A Jack Simple Sampler"
arch=(i686 x86_64)
url="http://shirkhan.dyndns.org/~tapas/"
license=('GPL')
depends=('jack' 'qt4' 'xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd')
source=("$url$pkgname-$pkgver.tar.bz2")
md5sums=('127bf56a83d5d8e58964d4454722d342')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [ -d bld ] || mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/bld"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
