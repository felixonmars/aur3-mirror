# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=mingw32-soil
pkgver=0708
pkgrel=2
pkgdesc="tiny C lib primarily for loading textures into OpenGL"
arch=('i686' 'x86_64')
url="http://www.lonesock.net/soil.html"
license=('public')
makedepends=('mingw32-gcc' 'unzip')
depends=('mingw32-runtime' 'freeglut')
#options=('!libtool')
source=("http://www.lonesock.net/files/soil.zip")
md5sums=('4736ac4f34fd9a41fa0197eac23bbc24')
options=('!strip')

build() {
  cd "${srcdir}/Simple OpenGL Image Library/projects/makefile"
  [[ -d obj ]] && rm -r obj/
  mkdir obj/

  sed "s|LOCAL = /usr/local|LOCAL = ${pkgdir}/usr/i486-mingw32|g" -i makefile
  sed "s|CXX = gcc|CXX = i486-mingw32-gcc|g" -i makefile
  sed "s|CXXFLAGS = |CXXFLAGS = -fPIC |g" -i makefile
  mkdir -p ${pkgdir}/usr/i486-mingw32/{lib,include}
  make
  make install
  chmod 644 ${pkgdir}/usr/i486-mingw32/lib/libSOIL.a
  i486-mingw32-ranlib ${pkgdir}/usr/i486-mingw32/lib/libSOIL.a
}
