# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=filelight-frameworks-git
pkgver=r538.7c0e06d
pkgrel=1
pkgdesc="View disk usage information. KF5 Frameworks branch (GIT version)"
url="http://utils.kde.org/projects/filelight"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kparts' 'desktop-file-utils')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kdeutils-filelight' 'fileligth')
provides=('filelight')
source=("git://anongit.kde.org/filelight.git#branch=frameworks")
sha1sums=('SKIP')
install="filelight-frameworks-git.install"
_gitname=filelight

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
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
