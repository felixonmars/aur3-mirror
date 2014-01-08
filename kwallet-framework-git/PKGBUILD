# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-framework-git
pkgver=r8.b09a687
pkgrel=1
pkgdesc='KWallet Framework'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kwallet-framework'
license=('LGPL')
depends=('kwindowsystem-git' 'kconfig-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kwallet-framework)
provides=(kwallet-framework)
source=('git://anongit.kde.org/kwallet-framework.git')
md5sums=('SKIP')

pkgver() {
  cd kwallet-framework
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwallet-framework \
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
