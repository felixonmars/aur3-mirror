# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-akonadi
pkgver=1.12.1
pkgrel=1
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data"
arch=('i686' 'x86_64')
url='http://community.kde.org/KDE_PIM/Akonadi'
license=('LGPL')
depends=('shared-mime-info' 'boost-libs' 'mariadb' 'qt5-base' 'libxslt')
makedepends=('cmake' 'boost' 'postgresql')
optdepends=('postgresql: PostgreSQL backend')
install="${pkgname}.install"
conflicts=('akonadi-qt5')
source=("http://download.kde.org/stable/akonadi/src/akonadi-${pkgver}.tar.bz2")
md5sums=('9a4a99d10e003a267a515fc60de4f817')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../akonadi-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DINSTALL_QSQLITE_IN_QT_PREFIX=TRUE \
    -DAKONADI_BUILD_TESTS=OFF \
    -DQT5_BUILD=ON \
    -DWITH_SOPRANO=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
