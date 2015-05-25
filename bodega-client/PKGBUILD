# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=bodega-client
pkgver=0.2
pkgrel=1
pkgdesc="Plasma Active app store"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('plasma-mobile')
makedepends=('cmake' 'automoc4')
groups=('plasma-active')
source=("http://download.kde.org/stable/active/4.0/src/${pkgname}-${pkgver}.tar.xz")
md5sums=('1d08e8ac1d0da9762d0b7fed2f50a13e')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}
