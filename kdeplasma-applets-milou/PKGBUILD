# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kdeplasma-applets-milou
pkgver=0.1
pkgrel=1
pkgdesc="A dedicated search application built on top of Baloo"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/milou'
license=('GPL')
depends=('kdebase-workspace')
conflicts=('milou<1')
replaces=('milou<1')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://download.kde.org/unstable/milou/$pkgver/src/milou-$pkgver.tar.xz")
md5sums=('6fc5b73daf039d330367ac124eb4da93')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../milou-$pkgver -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
