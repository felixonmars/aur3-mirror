pkgname=mingw32-lcms
pkgver=1.19
pkgrel=2
pkgdesc="Lightweight color management development library/engine (mingw32)"
arch=('any')
depends=('mingw32-runtime' 'mingw32-libtiff')
makedepends=('mingw32-gcc')
options=('!libtool' '!strip' '!buildflags')
optdepends=('mingw32-libjpeg: JPEG support')
license=('custom')
url="http://www.littlecms.com"
source=("http://downloads.sourceforge.net/sourceforge/lcms/lcms-${pkgver}.tar.gz")
md5sums=('8af94611baf20d9646c7c2c285859818')

build() {
  cd "${srcdir}/lcms-${pkgver}"
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
  cd "${srcdir}/lcms-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}

# vim:set ts=2 sw=2 et:
