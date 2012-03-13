pkgname=mingw32-libiconv-static
pkgver=1.14
pkgrel=2
arch=(any)
pkgdesc="libiconv (mingw32, static)"
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
license=(LGPL)
url="http://www.gnu.org/software/libiconv/"
conflicts=('mingw32-libiconv')
provides=(mingw32-libiconv)
source=("http://ftp.gnu.org/pub/gnu/libiconv/libiconv-$pkgver.tar.gz")
md5sums=('e34509b1623cec449dfeb73d7ce9c6c6')
options=(!strip !buildflags !libtool)

build()
{
  cd "$srcdir/libiconv-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-static \
    --disable-shared \
    --disable-nls
  make
}

package() {
  cd "$srcdir/libiconv-$pkgver/build"
  make install DESTDIR=$pkgdir
  cd $pkgdir
  rm -rf "$pkgdir/usr/i486-mingw32/share"
  rm "$pkgdir/usr/i486-mingw32/lib/charset.alias"
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
