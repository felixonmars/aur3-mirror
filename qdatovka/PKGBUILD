# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=qdatovka
pkgver=4.1.0
pkgrel=1
pkgdesc='GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government'
arch=('i686' 'x86_64')
url='https://labs.nic.cz/page/2425/'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
conflicts=('datovka')
provides=('datovka')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://gitlab.labs.nic.cz/labs/$pkgname/repository/archive.tar.gz?ref=v$pkgver)
md5sums=('137605ec585f5d8cc7ddbeb27ee0e29c')

build() {
  cd $pkgname.git

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $pkgname.git

  make INSTALL_ROOT="${pkgdir}" install
}

