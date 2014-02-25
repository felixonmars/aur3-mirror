# Contributor: Artem Grunichev <gluk@umbrosia.ru>

pkgname=kde-artwork-active-git
pkgver=20140222
pkgrel=1
pkgdesc="Artworks for Plasma Active"
arch=('any')
url='http://plasma-active.org/'
license=('LGPL')
makedepends=('kdelibs' 'cmake' 'automoc4')
groups=('plasma-active-git')
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://anongit.kde.org/kde-artwork-active ${pkgname}-${pkgver}
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
