# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=openvf-git
_basename=openvf
pkgver=r32.79c2305
pkgrel=1
pkgdesc="Open vector format library."
license=('GPL')
arch=('any')
url="http://bitbucket.com/ekpyron/openvf/"
depends=('assimp' 'opencollada' 'yaml-cpp')
makedepends=('git' 'cmake')
conflicts=('openvf')
provides=('openvf')
source=('git+https://bitbucket.org/ekpyron/openvf.git')
md5sums=('SKIP')
options=(staticlibs)

pkgver() {
  cd "${srcdir}/$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg 'GIT checkout done or server timeout.'

  cd "${srcdir}/$_basename"
  
  rm -f build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/$_basename/build"
  make DESTDIR="${pkgdir}" install
}
