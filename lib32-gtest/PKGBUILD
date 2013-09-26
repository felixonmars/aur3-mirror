# Maintainer: Filipp Andjelo <filipp.andjelo@gmail.com>

pkgname=lib32-gtest
_pkgname=gtest
pkgver=1.7.0
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit, 32bit)"
arch=('x86_64')
url="http://code.google.com/p/googletest/"
license=('custom:BSD3')
options=('!libtool')
depends=("gtest=${pkgver}")
makedepends=('python2' 'cmake' 'gcc-multilib')
source=("http://googletest.googlecode.com/files/${_pkgname}-${pkgver}.zip")
sha1sums=('f85f6d2481e2c6c4a18539e391aa4ea8ab0394af')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  rm -rf build && mkdir build && cd build
  cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_SKIP_RPATH=ON ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 ${pkgdir}/usr/lib32
  install -m644 build/libgtest{,_main}.so ${pkgdir}/usr/lib32/
}
