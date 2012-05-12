pkgname=mingw32-taglib
pkgver=1.7.2
pkgrel=1
arch=(any)
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (mingw32)"
license=('GPL')
depends=(mingw32-runtime mingw32-zlib)
makedepends=(mingw32-gcc cmake)
options=(!strip !buildflags)
url="http://developer.kde.org/~wheeler/taglib.html"
source=("http://developer.kde.org/~wheeler/files/src/taglib-$pkgver.tar.gz"
"cmake-toolchain.cmake")
md5sums=('b0a9e797d3833fb933c7c3176de3d720'
         'dd2b2db48187dff84050fe191d309d81')

build()
{
  cd "$srcdir/taglib-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr/i486-mingw32/" \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/cmake-toolchain.cmake" \
    -DWITH_ASF=ON \
    -DWITH_MP4=ON
  make
}

package() {
  cd "$srcdir/taglib-$pkgver/build"
  
  make DESTDIR=${pkgdir} install
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
