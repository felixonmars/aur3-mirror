pkgname=mingw32-libtasn1
pkgver=2.13
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (mingw32)"
arch=(any)
license=("GPL3, LGPL")
depends=(mingw32-runtime)
makedepends=(mingw32-gcc wine)
options=(!strip !buildflags !libtool)
url="http://www.gnu.org/software/gnutls/"
source=("http://ftp.gnu.org/gnu/libtasn1/libtasn1-${pkgver}.tar.gz")
md5sums=('df27eaddcc46172377e6b907e33ddc83')

build() {
  cd "$srcdir/libtasn1-$pkgver"

  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host i486-mingw32
  make
}

package() {
  cd "$srcdir/libtasn1-$pkgver"
  make install DESTDIR=$pkgdir
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf $pkgdir/usr/i486-mingw32/share
}

# vim:set ts=2 sw=2 et:
