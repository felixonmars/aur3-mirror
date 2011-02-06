# Maintainer: Jan Kokemüller <jan dot kokemueller at gmail dot com>

pkgname=mingw32-opencv
pkgver=2.1.0
pkgrel=1
pkgdesc="Intel(R) Open Source Computer Vision Library (MinGW build)"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.willowgarage.com/"
depends=('mingw32-intel-tbb')
makedepends=('cmake')
options=(!strip)
source=(http://downloads.sourceforge.net/opencvlibrary/OpenCV-$pkgver-win.zip
        fix-typo.patch)
md5sums=('36da990766421b65f28c05397dc871c8'
         'f845733c4b48cdb653fe7ce8ec8bc325')

build() {
  cd $srcdir/OpenCV-$pkgver
  unset LDFLAGS
  patch -p1 < $startdir/fix-typo.patch
  cmake . -DCMAKE_TOOLCHAIN_FILE=$startdir/i486-mingw32.cmake \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
          -DWITH_TBB=ON
  make
}

package() {
  cd $srcdir/OpenCV-$pkgver
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/i486-mingw32/share/doc
  mv $pkgdir/usr/i486-mingw32/doc $pkgdir/usr/i486-mingw32/share/doc/opencv
  # install license file
  install -Dm644 $srcdir/OpenCV-$pkgver/doc/license.txt \
                 $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
