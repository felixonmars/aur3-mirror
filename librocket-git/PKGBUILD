# Maintainer: Eugene Tan <jmingtan at gmail dot com>

pkgname=librocket-git
pkgver=release.1.2.1.164.g96d91c3
pkgrel=1
pkgdesc="libRocket - The HTML/CSS User Interface library"
arch=('i686' 'x86_64')
url="http://librocket.com"
license=('MIT')
depends=(freetype2)
makedepends=(git cmake)
conflicts=(librocket)
provides=(librocket)
source=('git+http://github.com/lloydw/libRocket.git')
md5sums=('SKIP')

_gitname=libRocket

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$srcdir"
  cd $_gitname/Build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package () {
  cd $_gitname/Build
  make install DESTDIR=$pkgdir
}

# vim:set ts=4 sw=4 et:

