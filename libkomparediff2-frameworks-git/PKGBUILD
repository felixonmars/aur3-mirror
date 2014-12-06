# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkomparediff2-frameworks-git
pkgver=r254.2f9f05a
pkgrel=1
pkgdesc="Library to compare files and strings. KF5 Frameworks branch (GIT version)"
url='https://projects.kde.org/projects/kde/kdesdk/libkomparediff2'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('libkomparediff2')
provides=('libkomparediff2')
source=("git://anongit.kde.org/libkomparediff2#branch=frameworks")
sha1sums=('SKIP')
_gitname=libkomparediff2

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr build
  mkdir -p build
}

build() {
  cd build

  cmake "../${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
}

