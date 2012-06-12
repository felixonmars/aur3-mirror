pkgname=mingw32-gc
pkgver=7.2
pkgrel=1
pkgdesc="A garbage collector for C and C++ (mingw32)"
arch=(any)
license=('GPL')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-$pkgver.tar.gz")
url='http://www.hpl.hp.com/personal/Hans_Boehm/gc/'
md5sums=('d17aecedef3d73e75387fb63558fa4eb')

build() {
  cd "${srcdir}/gc-${pkgver}"

  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset LDFLAGS PKG_CONFIG_PATH
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-threads=win32
  make
}

package() {
  cd "${srcdir}/gc-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
