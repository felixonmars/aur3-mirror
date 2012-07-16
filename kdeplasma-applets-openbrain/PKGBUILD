# Maintainer: Dan Vratil <progdan@progdansoft.com>

pkgname=kdeplasma-applets-openbrain
pkgver=0.0.2.6.8
pkgrel=1
pkgdesc="An artificial intelligence desktop assistant"
arch=('i686' 'x86_64')
url="http://openbrain.sourceforge.net/"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-openbrain')
replaces=('plasmoid-openbrain')
source=("http://downloads.sourceforge.net/openbrain/openbrain-$pkgver.tar.bz2")
md5sums=('1755ba02009b8e91618d3ef88ed94c5e')

build() {
  mkdir build
  cd build
  cmake ../openbrain \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}