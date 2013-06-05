# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=remake-silene
pkgver=0.8
pkgrel=1
pkgdesc="build system that bridges the gap between make and redo"
arch=('i686' 'x86_64')
url="https://github.com/silene/remake"
license=('GPL3')
depends=('gcc-libs')
source=(https://github.com/silene/remake/archive/remake-$pkgver.tar.gz)
md5sums=('1706968d90600349f7863590fd5c8f38')
sha256sums=('933852553a23bffbd4f3929ca91490b3e65e8bc5c84d799e69f509eb4bdf5fdf')

build() {
  cd "$srcdir/remake-remake-$pkgver"
  (
    set -x
    g++ -o remake $CXXFLAGS remake.cpp $LDFLAGS
  )
}

package() {
  cd "$srcdir/remake-remake-$pkgver"
  install -D -m755 remake "${pkgdir}/usr/bin/remake"
}

# vim:set ts=2 sw=2 et:
