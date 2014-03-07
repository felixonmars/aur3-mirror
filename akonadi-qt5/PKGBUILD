# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=akonadi-qt5
pkgver=1.11.80
pkgrel=1
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data"
arch=('i686' 'x86_64')
url='http://community.kde.org/KDE_PIM/Akonadi'
license=('LGPL')
depends=('shared-mime-info' 'boost-libs' 'mariadb')
makedepends=('cmake' 'automoc4' 'boost' 'postgresql')
optdepends=('postgresql: PostgreSQL backend')
install="${pkgname}.install"
conflicts=('akonadi')
source=("http://download.kde.org/stable/akonadi/src/akonadi-${pkgver}.tar.bz2")
md5sums=('5f32da9e6370db56980d888f888cc3de')

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
