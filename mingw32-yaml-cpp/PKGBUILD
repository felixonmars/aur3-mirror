# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=mingw32-yaml-cpp
pkgver=0.3.0
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec (mingw32)"
license=('MIT')
arch=('any')
url="http://code.google.com/p/yaml-cpp/"
depends=('mingw32-runtime')
makedepends=('cmake' 'mingw32-gcc')
source=("http://yaml-cpp.googlecode.com/files/yaml-cpp-${pkgver}.tar.gz")
md5sums=('9aa519205a543f9372bf4179071c8ac6')
options=(!strip !buildflags)

mingw32=i486-mingw32

build() {
  # mingw32 has problems with --hash-style=gnu (default value)
  unset LDFLAGS

  cd "${srcdir}/yaml-cpp"
  echo "SET(CMAKE_SYSTEM_NAME Windows)" > win32.cmake
  echo "SET(CMAKE_C_COMPILER ${mingw32}-gcc)" >> win32.cmake
  echo "SET(CMAKE_CXX_COMPILER ${mingw32}-g++)" >> win32.cmake
  echo "SET(CMAKE_RC_COMPILER ${mingw32}-windres)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH /usr/${mingw32})" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> win32.cmake
  cmake . \
    -DCMAKE_TOOLCHAIN_FILE=win32.cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/${mingw32}"
  make
}

package() {
  cd "${srcdir}/yaml-cpp"
  make install DESTDIR="${pkgdir}"
}
