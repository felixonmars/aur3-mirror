# Maintainer: tikysal <tikysal@gmail.com>
# Derived from Daniel Ehlers'

pkgname=coinor-utils
pkgver=2.9.17
pkgrel=1
pkgdesc="COIN-OR collection of utility classes"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/CoinUtils"
license=('EPL')
groups=('coinor')
source=("http://www.coin-or.org/download/source/CoinUtils/CoinUtils-${pkgver}.tgz")
sha1sums=('d06a32e6e87ea433f646ea30deef9dd1d7ee1c8e')

build() {
  cd "$srcdir/CoinUtils-$pkgver"
  ./configure --prefix=/usr -C
  make
}

check() {
  cd "$srcdir/CoinUtils-$pkgver"
  make test
}

package() {
  cd "$srcdir/CoinUtils-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}
