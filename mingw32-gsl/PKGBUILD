pkgname=mingw32-gsl
pkgver=1.15
pkgrel=3
pkgdesc="The GNU Scientific Library (GSL) is a modern numerical library for C and C++ programmers (mingw32)"
url="http://www.gnu.org/software/gsl/gsl.html"
source=("http://ftp.belnet.be/mirror/ftp.gnu.org/gnu/gsl/gsl-$pkgver.tar.gz")
license=('GPL')
arch=(any)
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=('!libtool' '!strip' '!buildflags')
md5sums=('494ffefd90eef4ada678c306bab4030b')

build() {
  cd "${srcdir}/gsl-${pkgver}"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --host=i486-mingw32 \
    --prefix=/usr/i486-mingw32
  make
}

package() {
  cd "$srcdir/gsl-$pkgver/build"
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"
  rm -rf $pkgdir/usr/i486-mingw32/share/{info,man}
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
