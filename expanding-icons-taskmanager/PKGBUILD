# Maintainer: mumen1994 - Mumen Ayyat <mumen1994@gmail.com>

pkgname=expanding-icons-taskmanager
pkgver=93f2309
pkgrel=1
pkgdesc="Taskmanager QML for KDE, Expanding Icons Mode - git version"
arch=('x86_64')
url="http://quickgit.kde.org/?p=scratch/hein/expanding-icons-taskmanager.git"
license=('GPL' 'LGPL' 'BSD')
depends=('kdebase-workspace' 'kdelibs')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
provides=("expanding-icons-taskmanager")
conflicts=("expanding-icons-taskmanager")
install="${pkgname}.install"
source=(${pkgname}::git://anongit.kde.org/scratch/hein/expanding-icons-taskmanager.git)
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  mkdir -p build
  cd build

  cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
} 
