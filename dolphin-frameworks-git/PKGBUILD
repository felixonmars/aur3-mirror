# Maintainer: Antonio Rojas <arojas@archlinux,org>

pkgname=dolphin-frameworks-git
pkgver=r4825.7f4c397
pkgrel=1
pkgdesc="File Manager"
arch=(i686 x86_64)
url="http://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets-git knewstuff kio-extras kcmutils)
makedepends=(extra-cmake-modules git kdoctools python)
provides=(dolphin)
conflicts=(dolphin kdebase-dolphin)
source=('git://anongit.kde.org/dolphin.git#branch=frameworks')
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd dolphin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../dolphin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
