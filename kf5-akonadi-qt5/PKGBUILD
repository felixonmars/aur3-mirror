# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kf5-akonadi-qt5
pkgver=1.11.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://community.kde.org/KDE_PIM/Akonadi'
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data"
license=('LGPL')
depends=('shared-mime-info' 'boost-libs' 'mariadb' 'kf5-soprano-qt5-git')
makedepends=('cmake' 'boost' 'postgresql')
optdepends=('postgresql: PostgreSQL backend')
install=akonadi.install
source=("http://download.kde.org/stable/akonadi/src/akonadi-${pkgver}.tar.bz2")
md5sums=('580361613d04b260f807b2a4df099eca')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../akonadi-${pkgver} \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DINSTALL_QSQLITE_IN_QT_PREFIX=ON \
    -DAKONADI_BUILD_TESTS=OFF \
    -DQT5_BUILD=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
