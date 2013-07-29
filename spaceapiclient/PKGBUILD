# Maintainer: Matthias Dietrich <matthias.dietrich[at]wood-it[dot]de>
pkgname=spaceapiclient
pkgver=0.2.2
pkgrel=1
pkgdesc="Client for loading and parsing the spaceAPI."
url="http://wood-it.de"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qt5-base' 'spaceapidaemon')
optdepends=()
makedepends=('qt5-tools')
conflicts=()
replaces=()
backup=()
install=''
source=('http://files.phpbp.de/packages/spaceAPIClient-'$pkgver'.tar.gz')
md5sums=('9056f782af4389df5f11034e8de1843b')

build() {
  tar xvfz spaceAPIClient-$pkgver.tar.gz

  cd $srcdir
  qmake SpaceAPIClient.pro
  make -j3
}

package() {
  cd $srcdir
  INSTALL_ROOT=$PWD/../pkg/$pkgname make install
}
