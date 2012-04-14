# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw-w64-yaml-cpp-experimental-hg
pkgver=442
pkgrel=2
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec, experimental API (mingw-w64)"
license=('MIT')
arch=('i686' 'x86_64')
url="http://code.google.com/p/yaml-cpp/"
depends=('mingw-w64-boost')
makedepends=('cmake' 'mingw-w64-gcc' 'mercurial')
conflicts=('mingw-w64-yaml-cpp')
source=('yaml-cpp-pkg-config.patch')
md5sums=('fc8d36f00b6c0535b3229d8dea31a888')
_hgroot="https://code.google.com/p"
_hgrepo="yaml-cpp"
options=(!strip !buildflags)

_targetarch32=i686-w64-mingw32
_targetarch64=x86_64-w64-mingw32

build() {
  # mingw32 has problems with --hash-style=gnu (default value)
  unset LDFLAGS

  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi
  
  msg "Updating to new API..."
  hg up new-api || return 1
  
  msg "Applying patch..."
  patch -Np1 -i ../yaml-cpp-pkg-config.patch
  
  msg "Starting make..."
  
  rm -rf "$srcdir/$_hgrepo-build32"
  mkdir "$srcdir/$_hgrepo-build32"
  cd "$srcdir/$_hgrepo-build32"
  
  echo "SET(CMAKE_SYSTEM_NAME Windows)" > win32.cmake
  echo "SET(CMAKE_C_COMPILER ${_targetarch32}-gcc)" >> win32.cmake
  echo "SET(CMAKE_CXX_COMPILER ${_targetarch32}-g++)" >> win32.cmake
  echo "SET(CMAKE_RC_COMPILER ${_targetarch32}-windres)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH /usr/${_targetarch32})" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> win32.cmake
  cmake ../$_hgrepo \
    -DCMAKE_TOOLCHAIN_FILE=win32.cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/${_targetarch32}"
  make

  cd ..
  rm -rf "$srcdir/$_hgrepo-build64"
  mkdir "$srcdir/$_hgrepo-build64"
  cd "$srcdir/$_hgrepo-build64"
  
  echo "SET(CMAKE_SYSTEM_NAME Windows)" > win32.cmake
  echo "SET(CMAKE_C_COMPILER ${_targetarch64}-gcc)" >> win32.cmake
  echo "SET(CMAKE_CXX_COMPILER ${_targetarch64}-g++)" >> win32.cmake
  echo "SET(CMAKE_RC_COMPILER ${_targetarch64}-windres)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH /usr/${_targetarch64})" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> win32.cmake
  echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> win32.cmake
  cmake ../$_hgrepo \
    -DCMAKE_TOOLCHAIN_FILE=win32.cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/${_targetarch64}"
  make
}

package() {
  cd "${srcdir}/$_hgrepo-build32"
  make install DESTDIR="${pkgdir}"
  mv "${pkgdir}/usr/${_targetarch32}/bin/pkgconfig" "${pkgdir}/usr/${_targetarch32}/lib"
  rm -rf "${pkgdir}/usr/${_targetarch32}/bin"

  cd "${srcdir}/$_hgrepo-build64"
  make install DESTDIR="${pkgdir}"
  mv "${pkgdir}/usr/${_targetarch64}/bin/pkgconfig" "${pkgdir}/usr/${_targetarch64}/lib"
  rm -rf "${pkgdir}/usr/${_targetarch64}/bin"
}
