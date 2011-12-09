# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=tschack
pkgver=0.120.1
pkgrel=1
pkgdesc="Fork of jack1 that provides smp support and clickless connection changes"
arch=(i686 x86_64)
url="http://hochstrom.endofinternet.org/trac/tschack/wiki"
license=('GPL')
depends=('readline' 'celt' 'libsamplerate')
makedepends=('doxygen')
provides=('jack')
conflicts=('jack')
options=(!libtool)
source=(http://hochstrom.endofinternet.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('13e43bb65c4b8d176baf68171b244870')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
