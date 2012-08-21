pkgname=mingw32-freeglut
pkgver=2.8.0
pkgrel=4
pkgdesc="Provides functionality for small OpenGL programs. (mingw32)"
arch=(any)
license=('MIT')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://downloads.sourceforge.net/freeglut/freeglut-$pkgver.tar.gz")
url='http://freeglut.sourceforge.net/'
sha256sums=('197293ff886abe613bc9eb4a762d9161b0c9e64b3e8e613ed7c5e353974fba05')

build() {
  cd "${srcdir}/freeglut-${pkgver}"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --without-x
  make
}

package() {
  cd "${srcdir}/freeglut-${pkgver}/build"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib"
  make DESTDIR="${pkgdir}" install
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
