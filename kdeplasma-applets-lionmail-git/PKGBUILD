# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-lionmail-git
pkgver=379.1403675
pkgrel=1
epoch=1
pkgdesc="A Plasma widget displaying new and important email"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/plasma-lionmail"
license=('GPL')
depends=('kdepimlibs')
makedepends=('git' 'cmake' 'automoc4' 'boost')
provides=('kdeplasma-applets-lionmail')
conflicts=('kdeplasma-applets-lionmail' 'plasma-applet-lionmail')
source=("git://anongit.kde.org/plasma-lionmail.git")
md5sums=('SKIP')

pkgver() {
  cd plasma-lionmail
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  mkdir -p build
  cd build
  cmake ../plasma-lionmail \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}