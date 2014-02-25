# Contributor: Artem Grunichev <gluk@umbrosia.ru>

pkgname=declarative-plasmoids-git
pkgver=20140222
pkgrel=1
pkgdesc="A set of plasmoids (QML) for Plasma Active"
arch=('any')
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
groups=('plasma-active-git')
install=${pkgname}.install
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://anongit.kde.org/declarative-plasmoids ${pkgname}-${pkgver}
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
