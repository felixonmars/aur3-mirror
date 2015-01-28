# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=filelight-git
pkgver=r548.6266d09
pkgrel=1
pkgdesc="View disk usage information. (GIT version)"
url="http://utils.kde.org/projects/filelight"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kparts' 'desktop-file-utils')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('filelight' 'kdeutils-filelight')
provides=('filelight')
source=("git://anongit.kde.org/filelight.git")
sha1sums=('SKIP')
install="filelight-git.install"

pkgver() {
  cd filelight
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../filelight \
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
