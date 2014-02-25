# Contributor: Artem Grunichev <gluk@umbrosia.ru>

pkgname=share-like-connect-git
pkgver=20140222
pkgrel=1
pkgdesc="The share like and connect feature for KDE Plasma Active"
arch=(i686 x86_64)
url='http://plasma-active.org/'
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'git')
groups=('plasma-active-git')
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://anongit.kde.org/share-like-connect ${pkgname}-${pkgver}
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
