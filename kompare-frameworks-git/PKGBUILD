#maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kompare-frameworks-git
pkgver=r836.66957a7
pkgrel=1
pkgdesc="Diff/Patch Frontend. KF5 Frameworks branch (GIT version)"
url="https://www.kde.org/applications/development/kompare"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libkomparediff2-frameworks-git' 'ktexteditor-git' 'desktop-file-utils')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kdesdk-kompare' 'kompare')
provides=('kompare')
source=("git://anongit.kde.org/kompare.git#branch=frameworks")
sha1sums=('SKIP')
install="kompare-frameworks-git.install"
_gitname=kompare

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
