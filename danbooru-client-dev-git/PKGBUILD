# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=danbooru-client-dev-git
pkgver=v0.2.0.3.g65ec42d
pkgrel=1
pkgdesc="Application to access Danbooru-based image boards. Devel (WIP for KF5/Qt5) (GIT Version)"
url="http://www.dennogumi.org/projects/danbooru-client"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('kdeclarative')
makedepends=('git' 'cmake' 'kdelibs4support')
conflicts=('danbooru-client')
source=("git+https://git.dennogumi.org/KDE/danbooru-client.git")
sha1sums=('SKIP')
install=danbooru-client-dev-git.install

pkgver() {
  cd danbooru-client
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../danbooru-client \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}