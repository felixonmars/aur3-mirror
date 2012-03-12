pkgname=mingw32-atkmm
pkgver=2.22.6
pkgrel=4
arch=(any)
pkgdesc="C++ bindings for atk (mingw32)"
depends=('mingw32-runtime' 'mingw32-atk>=1.32' 'mingw32-libsigc++2.0>=2.2.5')
makedepends=(mingw32-gcc)
license=(LGPL)
options=(!strip !buildflags !libtool)
url="http://gtkmm.sourceforge.net/"
source=("http://ftp.gnome.org/pub/GNOME/sources/atkmm/2.22/atkmm-$pkgver.tar.xz")
sha256sums=('0a74295106b9e3ae552b169eb4e098b8b825c4115045b9d5134a6c79a238aeb6')

build()
{
  cd "${srcdir}/atkmm-$pkgver"

  export CFLAGS="-march=i686 -O2 -pipe"
  export CXXFLAGS="$CFLAGS"
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset LDFLAGS PKG_CONFIG_PATH
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --disable-documentation
  make
}

package() {
  cd "${srcdir}/atkmm-$pkgver"
  make DESTDIR=$pkgdir install

  cd ${pkgdir}
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
