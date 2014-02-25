# Contributor: Artem Grunichev <gluk@umbrosia.ru>

pkgname=plasma-mobile-git
pkgver=20140222
pkgrel=1
pkgdesc="Plasma Active is intended for all types of tablets, smartphones and touch computing devices"
arch=(i686 x86_64)
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdebase-workspace' 'kde-artwork-active-git')
makedepends=('cmake' 'automoc4')
groups=('plasma-active-git')
install=${pkgname}.install
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://anongit.kde.org/plasma-mobile ${pkgname}-${pkgver}
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
