# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=mingw32-pcre
pkgver=8.31
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (mingw32)"
arch=('any')
depends=(mingw32-runtime mingw32-zlib mingw32-bzlib-static)
url="http://pcre.org"
license=('custom')
options=(!strip !buildflags !libtool)
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
source=("ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$pkgver.tar.bz2")
md5sums=('1c9a276af932b5599157f96e945391f0')

build() {
  cd "$srcdir/pcre-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-unicode-properties \
    --enable-jit \
    --enable-utf \
    --enable-pcre16 \
    --enable-pcregrep-libz \
    --enable-pcregrep-libbz2
  make
}

package() {
  cd "$srcdir/pcre-$pkgver/build"
  make DESTDIR="$pkgdir" install
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
