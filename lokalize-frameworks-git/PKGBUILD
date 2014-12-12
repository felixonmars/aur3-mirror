# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lokalize-frameworks-git
pkgver=r1022.42f9a33
pkgrel=1
pkgdesc="Computer-Aided Translation System. KF5 Frameworks branch. (GIT version)"
url="https://www.kde.org/applications/development/lokalize"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kross')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'hunspell')
optdepends=('hunspell: Spell checker')
conflicts=('kdesdk-lokalize' 'lokalize')
provides=('lokalize')
source=("git://anongit.kde.org/lokalize.git#branch=frameworks")
sha1sums=('SKIP')
install="lokalize-frameworks-git.install"
_gitname=lokalize

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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
