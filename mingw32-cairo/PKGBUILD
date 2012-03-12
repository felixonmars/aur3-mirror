pkgname=mingw32-cairo
pkgver=1.10.2
pkgrel=4
arch=(any)
pkgdesc="Cairo vector graphics library (mingw32)"
depends=(mingw32-runtime mingw32-libpng mingw32-pixman mingw32-fontconfig mingw32-freetype)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
optdepends=('mingw32-glib2: GObject support')
license=('LGPL' 'MPL')
url="http://cairographics.org/"
source=("http://cairographics.org/releases/cairo-${pkgver}.tar.gz")
sha1sums=('ccce5ae03f99c505db97c286a0c9a90a926d3c6e')

build()
{
  cd "$srcdir/cairo-$pkgver"

  export CFLAGS="$CFLAGS -mms-bitfields"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS PKG_CONFIG_PATH

  # ffs() is undefined
  sed -i '231i \
#ifdef __MINGW32__\
#define ffs __builtin_ffs\
#endif\
' "src/cairo-compiler-private.h"
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-xlib=no \
    --enable-xlib-xrender=no \
    --enable-win32=yes \
    --enable-win32-font=yes \
    --enable-png=yes \
    --enable-shared \
    --enable-static

  sed -i "s/deplibs_check_method=.*/deplibs_check_method=pass_all/g" libtool

  make
}

package () {
  cd "$srcdir/cairo-$pkgver/build"
  make install DESTDIR="$pkgdir"

  cd "$pkgdir"
  rm -rf "$pkgdir/usr/i486-mingw32/share"
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
