# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kontakter
pkgver=0.2
pkgrel=2
pkgdesc="Easy to use address book with advanced search functionality and a very intuitive user interface."
arch=('i686' 'x86_64')
url="https://launchpad.net/kontakter"
license=('GPL3')
depends=('qt4')
source=(http://launchpad.net/kontakter/stable/v${pkgver}/+download/Kontakter_v${pkgver}_src.tar.bz2)
md5sums=('deaede69559b9c4a67c5d8f1498156eb')

prepare() {
  cd $srcdir/Kontakter/src/client
  # Kontakter's client
  qmake-qt4

  # Kontakter's server
  cd $srcdir/Kontakter
  qmake-qt4
}

build() {
  cd $srcdir/Kontakter/src/client
  # Kontakter's client
  make

  # Kontakter's server
  cd $srcdir/Kontakter
  make
}

package() {
  cd $srcdir/Kontakter/src/client
  install -Dm755 client $pkgdir/usr/bin/kontakter
  cp -R $srcdir/Kontakter/src/installers/deb/usr/share/ $pkgdir/usr 
  install -Dm755 ../server/server $pkgdir/usr/bin/kontakter-server
}