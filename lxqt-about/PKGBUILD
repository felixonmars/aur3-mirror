# Contributor: Antonio Rojas

pkgname=lxqt-about
pkgver=0.8.0
pkgrel=1
pkgdesc="About dialog for LXQt"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
groups=('lxqt')
depends=('liblxqt')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/lxqt/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('6c5eed82fffc58a508dcd35531e65376')

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
