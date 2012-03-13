pkgname=mingw32-libglademm
pkgver=2.6.7
pkgrel=2
arch=(any)
pkgdesc="A C++ wrapper for libglade. (mingw32)"
depends=(mingw32-runtime mingw32-libglade)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
license=('LGPL')
url="http://www.gtkmm.org/"
source=("http://ftp.gnome.org/pub/gnome/sources/libglademm/2.6/libglademm-${pkgver}.tar.bz2")
md5sums=('f9ca5b67f6c551ea98790ab5f21c19d0')

build()
{
  cd "$srcdir/libglademm-$pkgver"
  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/libglademm-$pkgver/build"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib"
  make install DESTDIR=$pkgdir
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
