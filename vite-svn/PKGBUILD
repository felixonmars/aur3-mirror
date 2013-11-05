# Maintainer: Kniyl <mathias dot ettinger at gmail dot com>


pkgname=vite-svn
_svnmod="vite"
pkgver=1404
pkgrel=1
pkgdesc="Pajé like visualizer trace explorer in C++ programming language"
url="http://vite.gforge.inria.fr/index.php"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'glu')
makedepends=('cmake' 'subversion')
source=("${_svnmod}::svn://scm.gforge.inria.fr/svnroot/vite/trunk")
md5sums=('SKIP')

pkgver() {
  cd $_svnmod
  svnversion
}

prepare() {
  cd $_svnmod

  msg "Applying patches..."
  sed -i '50i\#include <GL/glu.h>' src/render/Geometry.hpp
}

build() {
  cd $_svnmod

  msg "Starting configure.."
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVITE_ENABLE_OTF=OFF

  msg "Starting make..."
  make 
}

package() {
  cd $_svnmod
  make DESTDIR="${pkgdir}" install
}
