pkgname=mingw32-libmspack-static
pkgver=0.3alpha
pkgrel=2
pkgdesc="Provides both compression and decompression of some loosely related file formats used by Microsoft (mingw32, static)"
arch=(any)
url="http://www.cabextract.org.uk/libmspack/"
license=('LGPLv2')
depends=(mingw32-runtime)
makedepends=('mingw32-gcc')
options=(!strip !buildflags !libtool)
source=("http://www.cabextract.org.uk/$libmspack/libmspack-${pkgver}.tar.gz")
md5sums=('08d08455b6d58ea649b35febd23f6386')

build() {
  cd "$srcdir/libmspack-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --disable-shared # compile error
  make
}

package() {
  cd "$srcdir/libmspack-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}

