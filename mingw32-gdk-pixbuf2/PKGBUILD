pkgname=mingw32-gdk-pixbuf2
pkgver=2.24.1
pkgrel=6
pkgdesc="An image loading library (mingw32)"
arch=(any)
url="http://www.gtk.org/"
license=('GPL2')
depends=(mingw32-runtime 'mingw32-glib2>=2.28' mingw32-libpng mingw32-libjpeg mingw32-libtiff)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://download.gnome.org/sources/gdk-pixbuf/2.24/gdk-pixbuf-$pkgver.tar.xz"
        "patch-missing-init-function-f5aeddd.diff")
sha256sums=('da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1'
            '0b951415a23f3ef14ae3d8f63c6932838b68cdd5e12bcf6b66bb7072f2cf7013')

build() {
  cd "$srcdir/gdk-pixbuf-$pkgver"

  # patch for bug https://bugzilla.gnome.org/show_bug.cgi?id=666927
  patch -Np1 -i "${srcdir}/patch-missing-init-function-f5aeddd.diff"

  export CXX=i486-mingw32-g++
  export CFLAGS="-O2 -pipe -march=i686 -mms-bitfields"
  export CXXFLAGS="${CFLAGS}"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset PKG_CONFIG_PATH
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --with-included-loaders=png
  make
}

package() {
  cd "$srcdir/gdk-pixbuf-$pkgver"
  make DESTDIR="${pkgdir}" install
  rm -rf $pkgdir/usr/i486-mingw32/{share,man}
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/gdk-pixbuf-2.0/2.10.0/loaders/*.a
  rm $pkgdir/usr/i486-mingw32/lib/*.def
}

# vim:set ts=2 sw=2 et:
