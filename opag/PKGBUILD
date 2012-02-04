# Contributor: Michael Klimczak <comm@schattensaiten.net>

pkgname=opag
pkgver=0.8.1
pkgrel=1
pkgdesc="Option Parser Generator - takes a description of command line arguments and creates a C(++) function that asigns variables accordingly."
arch=(i686 x86_64)
url="http://www.zero-based.org/software/opag"
license=('GPL')
depends=(gcc)
makedepends=(make)
source=(http://www.zero-based.org/software/opag/$pkgname-$pkgver.tar.gz)
md5sums=('41fa9283df7a67429c19c223084dff73')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
