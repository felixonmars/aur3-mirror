# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=xz-musl-static
pkgver=5.0.5
pkgrel=2
pkgdesc="Library and command line tools for XZ and LZMA compressed files, statically linked against musl libc"
arch=('i686' 'x86_64')
url="http://tukaani.org/xz/"
license=('GPL' 'LGPL' 'custom')
makedepends=('make' 'musl-static')
provides=()
conflicts=()
options=(strip !libtool staticlibs !upx !debug)
source=(http://tukaani.org/xz/xz-$pkgver.tar.xz)
md5sums=('aa17280f4521dbeebed0fbd11cd7fa30')

build() {
  cd "$srcdir/xz-$pkgver"
  export CC="musl-gcc"
  export CFLAGS="-O0 -fomit-frame-pointer -static"
  ./configure --prefix=/usr/musl --disable-debug --disable-xzdec --disable-lzmadec --disable-lzmainfo --disable-lzma-links --disable-scripts --enable-static --disable-shared
  make
}

package() {
  cd "$srcdir/xz-$pkgver"
  make DESTDIR="$pkgdir/" install
}

