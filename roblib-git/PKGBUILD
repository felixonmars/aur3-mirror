# Maintainer: Aaron Kimmig <aaron.kimmig(at)student.hpi.uni-potsdam.de>

pkgname=roblib-git
pkgrel=1
pkgver=1.daf04cb
pkgdesc="C++ library for robotics"
arch=('any')
url="http://www.roboticslibrary.org/"
license=('GPL')
depends=('cgal' 'coin')
optdepends=('soqt' 'pqp' 'bullet')
makedepends=('git' 'cmake')
source=('git+https://github.com/roboticslibrary/rl.git')
sha256sums=('SKIP')

_gitname="rl"

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  cmake -D"CMAKE_INSTALL_PREFIX=/usr" -G"Unix Makefiles"
  make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}/" install
} 
