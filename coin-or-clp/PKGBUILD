# Maintainer: tikysal <tikysal@gmail.com>
# Derived from Daniel Ehlers'

pkgname=coin-or-clp
pkgver=1.14.8
pkgrel=1
pkgdesc="Clp (Coin-or linear programming) is an open-source linear programming solver written in C++."
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Clp"
license=('EPL')
groups=('coin-or')
depends=('coin-or-utils>=2.8.8') 
makedepends=('coin-or-utils>=2.8.8') 
source=(http://www.coin-or.org/download/source/Clp/Clp-$pkgver.tgz)
sha1sums=('9e81232fb9ad3a8060827a8b5592b933cbbbfe4a')

build() {
  cd "$srcdir/Clp-$pkgver"
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-coinutils-lib="`pkg-config --libs coinutils`" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd "$srcdir/Clp-$pkgver"
  make test
}

package() {
  cd "$srcdir/Clp-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}
