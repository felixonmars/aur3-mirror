# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

pkgname=googletest-svn
pkgver=659
pkgrel=1
pkgdesc="Google Test (GTest) - C++ testing utility based on the xUnit framework (like JUnit)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/googletest/"
license=('BSD')
options=('!libtool')
depends=()
makedepends=('python2' 'cmake' 'subversion')
conflicts=('gtest' 'gtest-svn' 'googletest')
provides=('gtest' 'googletest')
source=('gtest::svn+http://googletest.googlecode.com/svn/trunk'
        'linux-getthreadcount.patch')
sha1sums=('SKIP'
          'bb1578b22331843657f1637c67a7306e7abde762')

pkgver() {
  cd "${srcdir}/gtest"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "${srcdir}/gtest"

  patch -Np0<"${srcdir}/linux-getthreadcount.patch"
}

build() {
  cd "${srcdir}/gtest"

  rm -rf build
  mkdir build
  cd build

  cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON ..
  make
}

package() {
  cd "${srcdir}/gtest"

  mkdir -pm 0755 "${pkgdir}/usr/lib"
  install -m 0644 build/libgtest{,_main}.so "${pkgdir}/usr/lib"

  mkdir -pm 0755 "${pkgdir}/usr/include/gtest/internal"
  install -m 0644 include/gtest/*.h "${pkgdir}/usr/include/gtest"
  install -m 0644 include/gtest/internal/*.h "${pkgdir}/usr/include/gtest/internal"

  mkdir -pm 0755 ${pkgdir}/usr/share/{doc,licenses}/${pkgname}
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 0644 CHANGES CONTRIBUTORS README "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -pm 0755 ${pkgdir}/usr/src/gtest/{src,include,cmake}
  install -m 0644 src/* "${pkgdir}/usr/src/gtest/src"
  ln -s ../../../include/gtest "${pkgdir}/usr/src/gtest/include/gtest"
  install -m 0644 CMakeLists.txt "${pkgdir}/usr/src/gtest"
  install -m 0644 cmake/* "${pkgdir}/usr/src/gtest/cmake"
}
