pkgname=mingw32-pango
pkgver=1.30.1
pkgrel=1
arch=(any)
pkgdesc="A library for layout and rendering of text (mingw32)"
depends=('mingw32-runtime' 'mingw32-cairo>=1.7.6' 'mingw32-glib2>=2.24')
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
license=('LGPL')
url="http://www.gtk.org/"
source=("http://ftp.gnome.org/pub/gnome/sources/pango/1.30/pango-${pkgver}.tar.xz")
sha256sums=('3a8c061e143c272ddcd5467b3567e970cfbb64d1d1600a8f8e62435556220cbe')

build()
{
  cd "$srcdir/pango-$pkgver"
  export CXX=i486-mingw32-g++
  export CFLAGS="-O2 -pipe -march=i686 -mms-bitfields"
  export CXXFLAGS="$CFLAGS"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS PKG_CONFIG_PATH
  sed -i 's/have_libthai=true/have_libthai=false/' configure
  mkdir -p build2 && cd build2
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --with-included-modules=yes \
    --with-dynamic-modules=no \
    --disable-introspection
  make
}

package() {
  cd "$srcdir/pango-$pkgver/build2"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib/"
  make install DESTDIR="$pkgdir"
  cd "$pkgdir"
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf $pkgdir/usr/i486-mingw32/{share,man}
  rm $pkgdir/usr/i486-mingw32/lib/*.def
}

