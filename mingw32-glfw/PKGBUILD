# Maintainer: Michael Ensslin <michael@ensslin.cc>
pkgname=mingw32-glfw
pkgver=2.7.7
pkgrel=1
pkgdesc="A free, open source, portable framework for OpenGL application development (mingw32)"
arch=('any')
url="http://www.glfw.org/"
license=('ZLIB')
makedepends=('mingw32-gcc')
depends=('mingw32-runtime')
options=('!strip')
source=(glfw-${pkgver}.tar.gz::"http://downloads.sourceforge.net/project/glfw/glfw/${pkgver}/glfw-${pkgver}.tar.bz2")
md5sums=('873a721fc415268e2b794d4dd08c558f')

build() {
  cd "${srcdir}/glfw-${pkgver}"
  make "TARGET=i486-mingw32-" "PREFIX=/usr/i486-mingw32" cross-mgw
}

package() {
  cd "${srcdir}/glfw-${pkgver}"
  make "TARGET=i486-mingw32-" "PREFIX=${pkgdir}/usr/i486-mingw32" cross-mgw-install

  #copy license file
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}/glfw-${pkgver}/COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
