# Maintainer: William Robertson <wkr@wkr.io>

pkgname=libpo6
pkgver=0.5.0
pkgrel=2
pkgdesc="POSIX wrappers for C++."
arch=('i686' 'x86_64')
url="https://github.com/rescrv/po6"
license=('BSD')
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('59f6a95ed3858ca0707836d10b3ddae9')

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
