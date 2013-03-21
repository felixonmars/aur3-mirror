# Maintainer: tikysal <tikysal@gmail.com>
# Derived from Daniel Ehlers'

pkgname=coin-or-utils
pkgver=2.8.8
pkgrel=1
pkgdesc="CoinUtils (Coin-or Utilities) is an open-source collection of classes and functions that are generally useful to more than one COIN-OR project."
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/CoinUtils"
license=('EPL')
groups=('coin-or')
source=(http://www.coin-or.org/download/source/CoinUtils/CoinUtils-$pkgver.tgz)
sha1sums=('64791e9c5f2dc50b891dd2b0d710ddf81d302864')

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
