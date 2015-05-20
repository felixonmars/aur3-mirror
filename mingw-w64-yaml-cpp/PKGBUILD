# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw-w64-yaml-cpp
_basename=yaml-cpp
pkgver=0.5.2
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec (mingw-w64)"
license=('MIT')
arch=('any')
url="http://code.google.com/p/yaml-cpp/"
depends=('mingw-w64-boost' 'mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'git')
source=("$_basename-$pkgver::git+https://github.com/jbeder/yaml-cpp.git#tag=release-$pkgver")
options=(!strip !buildflags staticlibs)
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"



build() {
  unset LDFLAGS

  for _arch in ${_architectures}; do
    rm -rf "${srcdir}/build-${_arch}"
    mkdir "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    
    ${_arch}-cmake ../$_basename-$pkgver -DYAML_CPP_BUILD_TOOLS=NO -DBUILD_SHARED_LIBS=OFF
    make

    rm -rf "${srcdir}/build-${_arch}-shared"
    mkdir "${srcdir}/build-${_arch}-shared"
    cd "${srcdir}/build-${_arch}-shared"
    
    ${_arch}-cmake ../$_basename-$pkgver -DYAML_CPP_BUILD_TOOLS=NO -DBUILD_SHARED_LIBS=ON
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make install DESTDIR="${pkgdir}"

    cd "${srcdir}/build-${_arch}-shared"
    make install DESTDIR="${pkgdir}"

    mv "${pkgdir}"/usr/${_arch}/lib/yaml-cpp.dll.a "${pkgdir}"/usr/${_arch}/lib/libyaml-cpp.dll.a
	${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
