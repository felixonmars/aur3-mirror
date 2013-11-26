# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=tcc-musl-static
pkgver=0.9.26
pkgrel=1
pkgdesc="Tiny C Compiler, statically linked against musl libc"
arch=('i686' 'x86_64')
url="http://bellard.org/tcc/"
license=('LGPL')
makedepends=('make' 'musl-static')
conflicts=(tcc)
options=(strip !libtool staticlibs !upx !debug)
source=(http://download.savannah.gnu.org/releases/tinycc/tcc-$pkgver.tar.bz2)
md5sums=('5fb28e4abc830c46a7f54c1f637fb25d')

build() {
  cd "$srcdir/tcc-$pkgver"
  export CC="musl-gcc"
  export CFLAGS="-O0 -fomit-frame-pointer -static"
  ./configure --prefix=/usr/musl --bindir=/usr/bin --sharedir=/usr/share --strip-binaries
  make
}

package() {
  cd "$srcdir/tcc-$pkgver"
  make DESTDIR="$pkgdir/" install
}

