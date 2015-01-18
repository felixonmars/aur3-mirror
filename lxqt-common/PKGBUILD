# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=lxqt-common
pkgver=0.8.0
pkgrel=1
pkgdesc="Common data file required for running an lxde-qt session"
arch=('any')
url='http://lxqt.org/'
license=('LGPL')
groups=('lxqt')
depends=('liblxqt')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/lxqt/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('b48d6df01f23d56115448076ae875680')

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
