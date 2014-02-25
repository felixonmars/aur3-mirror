# Contributor: Artem Grunichev <gluk@umbrosia.ru>

pkgname=bodega-client-git
pkgver=20140222
pkgrel=1
pkgdesc="Plasma Active app store"
arch=('i686' 'x86_64')
url='http://plasma-active.org/'
license=('LGPL')
depends=('plasma-mobile-git')
makedepends=('cmake' 'automoc4')
groups=('plasma-active-git')
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://anongit.kde.org/share-like-connect ${pkgname}-${pkgver}
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
