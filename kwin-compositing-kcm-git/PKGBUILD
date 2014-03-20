# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Stefano Avallone <stavallo@gmail.com>

pkgname=kwin-compositing-kcm-git
pkgver=r132.0de20fd
pkgrel=1
pkgdesc='KCM for KWin, allowing the user to enable/disable and configure KWin effects'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/base/kwin-compositing-kcm'
license=('LGPL')
depends=('qt5-multimedia' 'kde-workspace-git')
makedepends=('extra-cmake-modules' 'git' 'kf5umbrella-git')
source=('git://anongit.kde.org/kwin-compositing-kcm.git')
md5sums=('SKIP')

pkgver() {
  cd kwin-compositing-kcm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwin-compositing-kcm \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
