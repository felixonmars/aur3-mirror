# Contributor: Antonio Rojas

pkgname=liblxqt
pkgver=0.8.0
pkgrel=1
pkgdesc="Common base library for most lxde-qt components"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
groups=('lxqt')
depends=('qt5-x11extras' 'libqtxdg')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/lxqt/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('7159035b93fc585b173f41c96b44a523')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
