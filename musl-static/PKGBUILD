# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=musl-static
pkgver=1.1.2
pkgrel=1
pkgdesc="An implementation of the C/POSIX standard library designed for static linking"
arch=('i686' 'x86_64')
url="http://www.musl-libc.org/"
license=('MIT')
makedepends=('make')
conflicts=('musl')
options=(strip !libtool staticlibs !upx !debug)
source=(http://www.musl-libc.org/releases/musl-$pkgver.tar.gz)
md5sums=('a81309e54efdf9c68baf679790fc5678')

build() {
  cd "$srcdir/musl-$pkgver"
  export CFLAGS="-O0 -fomit-frame-pointer"
  ./configure --prefix=/usr/musl --bindir=/usr/bin --disable-shared
  make
}

package() {
  cd "$srcdir/musl-$pkgver"
  make DESTDIR="$pkgdir/" install
}
