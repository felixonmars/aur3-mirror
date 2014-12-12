#maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kcharselect-frameworks-git
pkgver=r281.1bda2db
pkgrel=1
pkgdesc="Character Selector. KF5 Frameworks branch (GIT version)"
url="https://www.kde.org/applications/utilities/kcharselect/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kxmlgui')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kdeutils-kcharselect' 'kcharselect')
provides=('kcharselect')
source=("git://anongit.kde.org/kcharselect.git#branch=frameworks")
sha1sums=('SKIP')
install="kcharselect-frameworks-git.install"
_gitname=kcharselect

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
