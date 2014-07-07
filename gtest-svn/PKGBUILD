# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

pkgname=gtest-svn
epoch=1
pkgver=r690
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/googletest/"
license=('custom:BSD3')
depends=('gcc-libs' 'sh')
makedepends=('python2' 'subversion' 'cmake')
conflicts=('gtest')
provides=('gtest')
source=('gtest::svn+http://googletest.googlecode.com/svn/trunk')
sha256sums=('SKIP')

pkgver() {
  cd gtest

  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd gtest

  rm -rf build
  mkdir build
  cd build

  python2 ../scripts/fuse_gtest_files.py .. .

  cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON ..
  make
}

package() {
  cd gtest

  mkdir -pm 0755 "${pkgdir}/usr/"{lib,include/gtest/internal,share/licenses/${pkgname},src/gtest/src,src/gtest/cmake}

  install -m 0644 build/libgtest{,_main}.so "${pkgdir}/usr/lib/"

  install -m 0644 include/gtest/*.h "${pkgdir}/usr/include/gtest/"
  install -m 0644 include/gtest/internal/*.h "${pkgdir}/usr/include/gtest/internal/"

  install -m 0644 build/gtest/* "${pkgdir}/usr/src/gtest/src/"
  install -m 0644 src/gtest_main.cc "${pkgdir}/usr/src/gtest/src/"

  install -m 0644 CMakeLists.txt "${pkgdir}/usr/src/gtest/"
  install -m 0644 cmake/* "${pkgdir}/usr/src/gtest/cmake/"

  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
