# Contributor: Antonio Rojas

pkgname=libsysstat
pkgver=0.2.0
pkgrel=1
pkgdesc="Library used to query system statistics (net status, system resource usage, ...etc)"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('e767f4a7edd91e646a328f74bb312d66')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
