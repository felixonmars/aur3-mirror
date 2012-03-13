pkgname=mingw32-onig
pkgver=5.9.2
pkgrel=2
pkgdesc="a regular expressions library (mingw32)"
arch=(any)
url="http://www.geocities.jp/kosako3/oniguruma/"
license=('BSD')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=(!libtool !buildflags !strip)
source=("http://www.geocities.jp/kosako3/oniguruma/archive/onig-$pkgver.tar.gz")
md5sums=('0f4ad1b100a5f9a91623e04111707b84')

build() {
  cd "$srcdir/onig-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-static \
    --enable-shared
  make
}

package() {
  cd "$srcdir/onig-$pkgver/build"
  make DESTDIR=$pkgdir install
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
