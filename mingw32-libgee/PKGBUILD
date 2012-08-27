# Maintainer: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=mingw32-libgee
pkgver=0.6.5
pkgrel=1
pkgdesc="GObject collection library"
arch=(any)
url="http://live.gnome.org/Libgee"
license=('LGPL2.1')
depends=(mingw32-glib2)
makedepends=(mingw32-gcc)
options=(!buildflags !strip)
source=(http://ftp.gnome.org/pub/GNOME/sources/libgee/0.6/libgee-$pkgver.tar.xz)
sha256sums=('99b78db2492c533e386a07bce9aab1de4bdf23284b1a485b893683de388fff48')

build() {
  cd "$srcdir/libgee-$pkgver"
  
  export PKG_CONFIG_LIBDIR=/usr/i486-mingw32/lib/pkgconfig
  unset PKG_CONFIG_PATH
  unset LDFLAGS
  
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST
  make
}

package() {
  cd "$srcdir/libgee-$pkgver"

  make DESTDIR="$pkgdir/" install

  cd ${pkgdir}
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
}

