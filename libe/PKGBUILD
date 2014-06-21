# Maintainer: William Robertson <wkr@wkr.io>

pkgname=libe
pkgver=0.7.0
pkgrel=1
pkgdesc="High-performance data structures and utilities for C++."
arch=('i686' 'x86_64')
url="https://github.com/rescrv/e"
license=('BSD')
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
depends=('libpo6')
md5sums=('4b715d33434c8fa9143d8f0d8c2d6bf8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
