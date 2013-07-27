# Maintainer: Matthias Dietrich <matthias.dietrich[at]wood-it[dot]de>
pkgname=spaceapidaemon
pkgver=0.2.2
pkgrel=1
pkgdesc="Daemon for loading and parsing the spaceAPI."
url="http://wood-it.de"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qt5-base')
optdepends=()
makedepends=('qt5-tools')
conflicts=()
replaces=()
backup=()
install=''
source=('http://files.phpbp.de/packages/spaceAPIDaemon-'$pkgver'.tar.gz')
md5sums=('dbd952f4045af19ddb8459146d07d0bb')

build() {
  tar xvfz spaceAPIDaemon-$pkgver.tar.gz

  cd $srcdir
  qmake SpaceAPIDaemon.pro
  make -j3
}

package() {
  cd $srcdir
  INSTALL_ROOT=$PWD/../pkg/$pkgname make install
}
