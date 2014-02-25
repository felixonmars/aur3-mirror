# Contributor: Artem Grunichev <gluk@umbrosia.ru>

pkgname=contour-git
pkgver=20140222
pkgrel=1
pkgdesc="Shell and frameworks for Plasma Active"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('plasma-mobile-git' 'qtmobility')
makedepends=('cmake' 'automoc4')
groups=('plasma-active-git')
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://anongit.kde.org/contour ${pkgname}-${pkgver}
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
