# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=gzip-musl-static
pkgver=1.6
pkgrel=2
pkgdesc="GNU compression utility, statically linked against musl libc"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gzip/"
license=('GPL3')
makedepends=('make' 'musl-static')
provides=('gzip=1.6')
conflicts=(gzip)
options=(strip !libtool staticlibs !upx !debug)
source=(http://ftp.gnu.org/gnu/gzip/gzip-${pkgver}.tar.xz)
md5sums=('da981f86677d58a106496e68de6f8995')

build() {
  cd "$srcdir/gzip-$pkgver"
  export CC="musl-gcc"
  export CFLAGS="-O0 -fomit-frame-pointer -static"
  ./configure --prefix=/usr --libdir=/usr/lib/gzip
  make
}

package() {
  cd "$srcdir/gzip-$pkgver"
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/lib"
}

