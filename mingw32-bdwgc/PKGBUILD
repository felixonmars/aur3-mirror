pkgname=mingw32-bdwgc
pkgver=7.2alpha6
pkgrel=1
pkgdesc="C/C++ garbage collector library (mingw32)"
arch=(any)
license=('Unknown')
depends=(mingw32-gcc)
makedepends=(mingw32-gcc)
options=(!strip !buildflags)
source=(http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-$pkgver.tar.gz)
url='http://www.hpl.hp.com/personal/Hans_Boehm/gc/'
sha256sums=('ebf425b254773d565e1690287641ed177716a78e952c96fec917edbc64535c16')

build() {
  cd "${srcdir}/gc-${pkgver}"

  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset LDFLAGS PKG_CONFIG_PATH

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --enable-threads=win32
  make
}

package() {
  cd "${srcdir}/gc-${pkgver}"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib"
  make DESTDIR="${pkgdir}" install
}
