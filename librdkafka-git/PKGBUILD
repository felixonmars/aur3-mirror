# Maintainer: Eugenio Perez <eupm90@gmail.com>
pkgname=librdkafka-git
pkgver=0.8.5
pkgrel=20141123
pkgdesc="Magnus Edenhill's kafka library for C"
arch=('x86_64' 'i686')
url="https://github.com/edenhill/librdkafka"
license=('BSD')
depends=('zlib')
makedepends=('make')
source=("$pkgname::git+https://github.com/edenhill/librdkafka.git")
md5sums=(SKIP)

MAKEFLAGS+="-j1"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=$pkgdir
  make
}

check() {
  cd "$srcdir/$pkgname/src"
  make check
  cd "$srcdir/$pkgname/src-cpp"
  make check
}

package() {
  cd "$srcdir/$pkgname/"
  make install
}
