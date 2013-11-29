# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=nano-musl-static
pkgver=2.2.6
pkgrel=2
pkgdesc="An enhanced clone of the Pico text editor, statically linked against musl libc"
arch=('i686' 'x86_64')
url="http://www.nano-editor.org/"
license=('GPL')
depends=('ncurses-musl-static')
makedepends=('make' 'musl-static')
conflicts=('nano')
options=(strip !libtool staticlibs !upx !debug)
source=(http://www.nano-editor.org/dist/v2.2/nano-$pkgver.tar.gz)
md5sums=('03233ae480689a008eb98feb1b599807')

build() {
  cd "$srcdir/nano-$pkgver"
  export CC="musl-gcc"
  export CFLAGS="-O0 -fomit-frame-pointer -nostdinc -I/usr/musl/include/ncursesw -static"
  ./configure --prefix=/usr  --disable-nanorc --enable-utf8 --disable-color --disable-tabcomp --disable-justify --disable-speller --disable-browser --disable-wrapping --disable-mouse --disable-operatingdir
  make
}

package() {
  cd "$srcdir/nano-$pkgver"
  make DESTDIR="$pkgdir/" install
}
