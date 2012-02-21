# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
_pkgname=yaml-cpp
pkgname=lib32-${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec (32-bit library)"
license=('MIT')
arch=('x86_64')
url="http://code.google.com/p/yaml-cpp/"
makedepends=('cmake' 'gcc-multilib')
source=("http://yaml-cpp.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9aa519205a543f9372bf4179071c8ac6')
options=('!libtool')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd "${srcdir}/${_pkgname}"

  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D LIB_SUFFIX=32 \
    -D LIB_INSTALL_DIR=/usr/lib32 \
    -D BUILD_SHARED_LIBS=ON \
    .
  make
}

package () {  
  cd "${srcdir}/${_pkgname}"

  make install DESTDIR="${pkgdir}"

  rm -rf "${pkgdir}/usr/include"
}
