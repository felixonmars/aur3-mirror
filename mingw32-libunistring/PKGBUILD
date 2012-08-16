pkgname=mingw32-libunistring
pkgver=0.9.3
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings. (mingw32)"
arch=(any)
url="http://www.gnu.org/software/libunistring/"
license=("GPL")
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
source=("ftp://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.gz")
md5sums=('db8eca3b64163abadf8c40e5cecc261f')
options=(!strip !buildflags !libtool)

build() {
  cd "$srcdir/libunistring-$pkgver"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-threads=win32
  make
}

package() {
  cd "$srcdir/libunistring-$pkgver"
  make DESTDIR=${pkgdir} install
  i486-mingw32-strip -x -g "$pkgdir/usr/i486-mingw32/bin/"*.dll
  i486-mingw32-strip -g "$pkgdir/usr/i486-mingw32/lib/"*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
