# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=libcdr
pkgver=0.0.16
pkgrel=1
pkgdesc="CorelDraw file format importer library for LibreOffice"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/libreoffice/libcdr/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('libwpg' 'lcms2' 'icu')
makedepends=('boost')
source=("http://cgit.freedesktop.org/libreoffice/$pkgname/snapshot/$pkgname-$pkgver.zip")
md5sums=('c8021c7ff39e5657094dc2b3399bce45')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
