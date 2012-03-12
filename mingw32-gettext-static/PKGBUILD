pkgname=mingw32-gettext-static
pkgver=0.18.1.1
pkgrel=3
arch=(any)
pkgdesc="GNU internationalization library (mingw32, static)"
depends=(mingw32-runtime mingw32-libiconv-static)
makedepends=(mingw32-gcc)
license=(GPL LGPL)
url="http://www.gnu.org/software/gettext/"
source=("http://ftp.gnu.org/pub/gnu/gettext/gettext-$pkgver.tar.gz")
md5sums=('3dd55b952826d2b32f51308f2f91aa89')
options=(!strip !buildflags !libtool)
optdepends=('mono: for GNU.Gettext.dll'
'java-runtime: for libintl.jar')

build()
{
  cd "$srcdir/gettext-$pkgver/gettext-runtime"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-static \
    --disable-shared \
    --enable-threads=win32
  make
}

package() {
  cd "$srcdir/gettext-$pkgver/gettext-runtime/build"
  make DESTDIR=$pkgdir install
  cd $pkgdir
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf $pkgdir/usr/i486-mingw32/share/{doc,man}
  rm "$pkgdir/usr/i486-mingw32/share/gettext/ABOUT-NLS"
}