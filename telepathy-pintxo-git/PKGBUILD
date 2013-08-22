# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-pintxo-git
pkgver=2.e65110c
pkgrel=1
pkgdesc='SMS messaging with Telepathy'
arch=('i686' 'x86_64')
url='http://quickgit.kde.org/?p=scratch/kamath/telepathy-pintxo.git'
license=('GPL')
depends=('telepathy-qt-git')
makedepends=('cmake' 'git')
conflicts=('telepathy-pintxo')
source=('git://anongit.kde.org/scratch/kamath/telepathy-pintxo')
md5sums=('SKIP')

pkgver() {
  cd telepathy-pintxo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../telepathy-pintxo \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

