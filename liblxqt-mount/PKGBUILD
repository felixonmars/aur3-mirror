# Contributor: Antonio Rojas

pkgname=liblxqt-mount
pkgver=0.8.0
pkgrel=1
pkgdesc="Library used to manage removable devices"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
groups=('lxqt')
depends=('liblxqt' 'udisks2')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/lxqt/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('0d12418bb26fb4f630895231e5ecaffb')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
