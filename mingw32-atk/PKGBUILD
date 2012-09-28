pkgname=mingw32-atk
pkgver=2.2.0
pkgrel=4
pkgdesc="A library providing a set of interfaces for accessibility (mingw32)"
arch=(any)
license=('LGPL')
depends=(mingw32-runtime mingw32-glib2)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://ftp.gnome.org/pub/gnome/sources/atk/2.2/atk-${pkgver}.tar.xz")
url='http://www.gtk.org/'
sha256sums=('8b22f0e7803dd3734c676ccd68ea999ff1156ca49d99c3de5c1d269ad0c3739d')

build() {
  cd "${srcdir}/atk-${pkgver}"

  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS PKG_CONFIG_PATH
  
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "${srcdir}/atk-${pkgver}"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib"
  make DESTDIR="${pkgdir}" install
  cd "$pkgdir"
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm usr/i486-mingw32/lib/*.def
  rm -rf "usr/i486-mingw32/share/gtk-doc"
}
