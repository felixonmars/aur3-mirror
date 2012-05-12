# Maintainer: Erico Nunes <nunes dot erico at gmail>
# Contributor: Erico Nunes <nunes dot erico at gmail>
pkgname=glxx
pkgver=0.3
pkgrel=4
pkgdesc="A C++ OpenGL extensions loading library."
arch=('i686' 'x86_64')
url="https://bitbucket.org/yotis/glxx/wiki/Home"
license=(BSD)
depends=('libgl' 'mesa')
source=("https://bitbucket.org/yotis/${pkgname}/get/v${pkgver}.tar.gz")
md5sums=('3df47304c408a53fb59931cf5c6d4803')

build() {
  cd "${srcdir}/yotis-glxx-0b731cf91427"

  g++ -c -pipe -O2 -fPIC -Wall -W -D_REENTRANT -DNDEBUG -o glxx.o glxx.cpp
  g++ -c -pipe -O2 -fPIC -Wall -W -D_REENTRANT -DNDEBUG -o glXxx.o glXxx.cpp
  ar cqs libglxx.a glxx.o glXxx.o
}

package() {
  _lib=${pkgdir}/usr/lib
  _include=${pkgdir}/usr/include
  _share=${pkgdir}/usr/share/${pkgname}

  cd "${srcdir}/yotis-glxx-0b731cf91427"

  mkdir -p ${_lib} ${_include} ${_share}

  install -m 0644 libglxx.a ${_lib}
  install -m 0644 glxx.h ${_include}
  install -m 0644 _LICENSE.txt ${_share}
}

# vim:set ts=2 sw=2 et:
