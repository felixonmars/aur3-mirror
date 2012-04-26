pkgname=mingw32-fftw
pkgver=3.3.1
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (mingw32)"
arch=(any)
url="http://www.fftw.org"
license=('GPL')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
source=("http://www.fftw.org/fftw-$pkgver.tar.gz")
md5sums=('76f5f3c7577613d0fbedaae77450ac91')

build() {
  cd "$srcdir/fftw-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-shared \
    --enable-static \
    --enable-long-double \
    --with-our-malloc \
    --enable-threads=win32
  make
}

package()
{
  cd "$srcdir/fftw-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf $pkgdir/usr/i486-mingw32/share/{info,man}
}

# vim:set ts=2 sw=2 et:
