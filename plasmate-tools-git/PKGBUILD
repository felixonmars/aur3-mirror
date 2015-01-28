# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasmate-tools-git
pkgver=v1.0.54.gef69a83
pkgrel=1
pkgdesc='KDE Plasma tools that were in kde-workspace 4.9'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/sdk/plasmate'
license=('LGPL')
depends=('kdepimlibs')
makedepends=('cmake' 'git' 'automoc4' 'boost')
conflicts=('plasmate-git' 'plasmate' 'kdebase-workspace<=4.9.80')
source=('git://anongit.kde.org/plasmate')
md5sums=('SKIP')

pkgver() {
  cd plasmate
  git describe --always | sed 's|-|.|g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../plasmate \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_Soprano=OFF

  cd engineexplorer
  make
  cd ../

  cd plasmoidviewer
  make
}

package() {
  cd build/engineexplorer
  make DESTDIR="${pkgdir}" install
  cd ../..

  cd build/plasmoidviewer
  make DESTDIR="${pkgdir}" install
}
