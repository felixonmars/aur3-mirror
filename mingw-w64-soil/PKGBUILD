# Maintainer: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-soil
pkgver=0708
pkgrel=3
pkgdesc="Tiny C lib primarily for loading textures into OpenGL (mingw-w64)"
arch=('any')
url="http://www.lonesock.net/soil.html"
license=('public')
makedepends=('mingw-w64-gcc' 'unzip')
depends=('mingw-w64-crt')
source=("http://www.lonesock.net/files/soil.zip")
md5sums=('4736ac4f34fd9a41fa0197eac23bbc24')
options=('!strip' '!buildflags' 'staticlibs')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/Simple OpenGL Image Library/projects/makefile"
  mkdir -p obj
  for _arch in ${_architectures}; do
      mkdir -p "${srcdir}/${_arch}"
      cp -R ${srcdir}/Simple\ OpenGL\ Image\ Library/* "${srcdir}/${_arch}"
      cd "${srcdir}/${_arch}/projects/makefile"
      make LOCAL="${pkgdir}/${_arch}" \
           CXX=${_arch}-gcc
  done
}

package() {
  for _arch in ${_architectures}; do
      cd "${srcdir}/${_arch}/projects/makefile"
      mkdir -p "${pkgdir}"/usr/${_arch}/{lib,include}
      make LOCAL="${pkgdir}"/usr/${_arch} \
           CXX=${_arch}-gcc \
           install
      chmod 644 "${pkgdir}/usr/${_arch}/lib/libSOIL.a"
      ${_arch}-ranlib "${pkgdir}/usr/${_arch}/lib/libSOIL.a"
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
