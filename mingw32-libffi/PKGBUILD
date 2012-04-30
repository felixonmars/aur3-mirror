pkgname=mingw32-libffi
pkgver=3.0.11
pkgrel=1
pkgdesc="A portable, high level programming interface to various calling conventions (mingw32)"
arch=('any')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=('!libtool' '!strip')
license=('MIT')
url="http://sourceware.org/libffi"
source=("ftp://sourceware.org/pub/libffi/libffi-${pkgver}.tar.gz")
md5sums=('f69b9693227d976835b4857b1ba7d0e3')

build() {
  cd "${srcdir}/libffi-${pkgver}"

  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
      --prefix=/usr/i486-mingw32 \
      --host=i486-mingw32
  make
}

package() {
  cd "${srcdir}/libffi-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir/usr/i486-mingw32/share"
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}

# vim:set ts=2 sw=2 et:
