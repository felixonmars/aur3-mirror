# Maintainer: William Robertson <wkr@wkr.io>

pkgname=busybee
pkgver=0.5.0
pkgrel=1
pkgdesc="High performance messaging layer."
arch=('i686' 'x86_64')
url="https://github.com/rescrv/busybee"
license=('BSD')
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
depends=('libpo6' 'libe')
md5sums=('e5b69503935254a51f0f5e464a3865c4')

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
