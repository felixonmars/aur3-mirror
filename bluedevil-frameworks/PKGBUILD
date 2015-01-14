# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=bluedevil-frameworks
pkgver=5.1.95
pkgrel=1
pkgdesc='KDE bluetooth framework'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/bluedevil'
license=('GPL2')
groups=('plasma-next')
depends=('bluez' 'libbluedevil-frameworks' 'kio')
makedepends=('extra-cmake-modules')
conflicts=('bluedevil')
install=$pkgname.install
source=("http://download.kde.org/unstable/plasma/$pkgver/bluedevil-$pkgver.tar.xz")
md5sums=('9a090f1e4ae1d6c9d3ac1fd24877acf5')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../bluedevil-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
