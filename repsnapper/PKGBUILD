# Maintainer: MD <martin.dieringer@gmx.de>
pkgname=repsnapper
pkgver=2.0.0b01
pkgrel=1
pkgdesc="Controller and GCode generator for RepRap 3D printers"
arch=(i686 x86_64)
url="http://reprap.org/wiki/RepSnapper_Manual:Introduction"
license=('GPL')
depends=(gtkglext gtkmm freeglut libxml++ libzip)
makedepends=(perl perl-xml-parser)
source=(http://nodeload.github.com/timschmidt/repsnapper/tarball/$pkgver)
md5sums=('5d05598efa351b4d9dd57fe1fd248f97')

_rssrc=($srcdir/timschmidt-repsnapper-39af569)

build() {
  cd "$_rssrc"
  ./autogen.sh
  ./configure --prefix=/usr/local
  make
}

check() {
  cd "$_rssrc"
  make -k check
}

package() {
  cd "$_rssrc"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
