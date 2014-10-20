# Contributor: Antonio Rojas

pkgname=lxqt-runner
pkgver=0.8.0
pkgrel=1
pkgdesc="Launch applications quickly by typing commands"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
groups=('lxqt')
depends=('lxqt-globalkeys' 'qt5-script' 'menu-cache')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/lxqt/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('95d8fb3041987f89cb5d570eebfb99c9')

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
