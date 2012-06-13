pkgname=mingw32-pixman
pkgver=0.26.0
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo (mingw32)"
arch=(any)
url="http://xorg.freedesktop.org"
license=('LGPL' 'MPL')
depends=(mingw32-runtime)
makedepends=(bzip2 mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.bz2")
md5sums=('d0c41a51db89efec669812e66a5582fa')

build() {
  cd "${srcdir}/pixman-${pkgver}"
  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS PKG_CONFIG_PATH
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --disable-gtk
  make
}

package() {
  cd "${srcdir}/pixman-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  rm -rf "$pkgdir/usr/i486-mingw32/share"
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
