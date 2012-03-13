pkgname=mingw32-gtkmm
pkgver=2.24.2
pkgrel=2
arch=(any)
pkgdesc="C++ bindings for gtk2 (mingw32)"
depends=('mingw32-runtime' 'mingw32-gtk2>=2.20' 'mingw32-pangomm>=2.26'
         'mingw32-glibmm>=2.24' 'mingw32-atkmm')
makedepends=(mingw32-gcc)
license=(LGPL)
options=(!strip !buildflags !libtool)
url="http://gtkmm.sourceforge.net/"
source=("http://ftp.gnome.org/pub/GNOME/sources/gtkmm/2.24/gtkmm-$pkgver.tar.bz2")
sha256sums=('771a69c3252d06b20d4e8be4822bd7fa3b58424458733e3526218a128f1fea34')

build()
{
  cd "${srcdir}/gtkmm-$pkgver"
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_PATH="/usr/${_target}/lib/pkgconfig"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "${srcdir}/gtkmm-$pkgver"
  make install DESTDIR=${pkgdir}

  cd "$pkgdir"
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
