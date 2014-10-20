# Contributor: Antonio Rojas

pkgname=lxqt-panel
pkgver=0.8.0
pkgrel=1
pkgdesc="LXQt desktop panel"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
groups=('lxqt')
depends=('lxqt-globalkeys' 'liblxqt-mount' 'icu' 'lm_sensors' 'libpulse' 'libsysstat' 'menu-cache' 'lxmenu-data')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/lxqt/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('2d2c2251659f285031f65bfb30c741c3')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX="" \
    -DUSE_QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
