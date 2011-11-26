# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=mingw32-gtest
pkgver=1.6.0
pkgrel=2
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit) (mingw32)"
arch=('any')
url="http://code.google.com/p/googletest/"
license=('BSD')
makedepends=('mingw32-gcc' 'cmake')
depends=('mingw32-runtime')
options=('!strip' '!buildflags')
source=("http://googletest.googlecode.com/files/gtest-$pkgver.zip"
        "cmake-toolchain.cmake")
sha256sums=('5ec97df8e75b4ee796604e74716d1b50582beba22c5502edd055a7e67a3965d8'
            '271d6ae06f0a40a7ef572468eb4546490e59cd993f321f9a8b6c2a7dc8d86e32')

build() {
  cd "${srcdir}/gtest-$pkgver"
 
  unset LDFLAGS

  rm -rf build && mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32/ \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/cmake-toolchain.cmake" \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=release \
    -Dgtest_disable_pthreads=ON
  make
}

package() {
  cd "${srcdir}/gtest-$pkgver"

  mkdir -pm 0755 "$pkgdir"/usr/i486-mingw32/{lib,include/gtest/internal}
  install -m 0644 build/libgtest{,_main}.a "$pkgdir"/usr/i486-mingw32/lib/
  install -m 0644 include/gtest/*.h "$pkgdir"/usr/i486-mingw32/include/gtest/
  install -m 0644 include/gtest/internal/*.h "$pkgdir"/usr/i486-mingw32/include/gtest/internal/
}
