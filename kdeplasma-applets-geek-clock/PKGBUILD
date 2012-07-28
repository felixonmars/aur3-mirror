# Contributor: Vitaliy Ivanov <wicharek@gmail.com>

pkgname=kdeplasma-applets-geek-clock
pkgver=1.0
pkgrel=1
pkgdesc="Plasmoid for KDE depicting the Geek Clock"
arch=('i686' 'x86_64')
url="http://w2f2.com/projects/geekclock"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('geek-clock-plasmoid')
replaces=('geek-clock-plasmoid')
source=("http://w2f2.com/projects/geekclock/geek-clock-plasmoid-$pkgver-src.tar.gz")
md5sums=('0606169b6811327358987f52fbbe1ebb')

build() {
  mkdir build
  cd build
  cmake ../geek-clock-plasmoid-$pkgver-src \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}