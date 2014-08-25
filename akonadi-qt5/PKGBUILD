# Maintainer: Antonio Rojas
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=akonadi-qt5
pkgver=1.13.0
pkgrel=1
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data"
arch=('i686' 'x86_64')
url='http://community.kde.org/KDE_PIM/Akonadi'
license=('LGPL')
depends=('shared-mime-info' 'boost-libs' 'mariadb' 'qt5-base')
makedepends=('cmake' 'boost' 'postgresql')
optdepends=('postgresql: PostgreSQL backend')
install="${pkgname}.install"
conflicts=('akonadi')
provides=('akonadi')
source=("http://download.kde.org/stable/akonadi/src/akonadi-${pkgver}.tar.bz2")
md5sums=('84eb2e471bd6bdfe54a2a2f1d858c07d')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../akonadi-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
