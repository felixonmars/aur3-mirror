pkgname=mingw32-gcrypt
pkgver=1.5.0
pkgrel=3
pkgdesc="a general purpose crypto library based on the code used (mingw32)"
arch=('any')
license=('GPL')
depends=(mingw32-runtime mingw32-libgpg-error)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
url="http://www.gnupg.org"
source=("ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2")
md5sums=('693f9c64d50c908bc4d6e01da3ff76d8')

build() {
  cd "$srcdir/libgcrypt-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host i486-mingw32 \
    --enable-static \
    --enable-shared
  make
}

package() {
  cd "$srcdir/libgcrypt-$pkgver/build"
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"
  rm -rf "$pkgdir/usr/i486-mingw32/share/info"
  rm $pkgdir/usr/i486-mingw32/lib/*.def
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}

# vim:set ts=2 sw=2 et:
