# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=ncurses-musl-static
pkgver=5.9
pkgrel=3
pkgdesc="System V Release 4.0 curses emulation library, statically linked against musl libc"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ncurses/"
license=('MIT')
makedepends=('make' 'musl-static' 'tcc-musl-static')
conflicts=()
options=(strip !libtool staticlibs !upx !debug)
source=(http://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz)
md5sums=('8cb9c412e5f2d96bc6f459aa8c6282a1')

build() {
  cd "$srcdir/ncurses-$pkgver"
  export CC="musl-gcc"
  export CFLAGS="-O0 -fomit-frame-pointer -static"
  ./configure --prefix=/usr/musl --without-cxx-binding --without-shared --with-normal --without-debug --enable-widec
  make
}

package() {
  cd "$srcdir/ncurses-$pkgver"
  make DESTDIR="$pkgdir/" install
}
