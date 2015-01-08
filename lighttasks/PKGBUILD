#Maintainer: Alex Theotokatos <alex dot theoto at yahoo dot gr>
### Older contributors
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Shafqat Bhuiyan <priomsrb at gmail dot com>
pkgname=lighttasks
_pkgname=lighttasks
pkgver=0.2
pkgrel=2
pkgdesc="simple and lightweight task timer."
arch=(any)
url="https://github.com/priomsrb/lighttasks"
license=('GPL2')
depends=('qt4')
provides=('lighttasks')
source=("https://github.com/priomsrb/lighttasks/archive/v0.2.tar.gz")
md5sums=('835f735ccf2ef1b67f469a17abec7a9b')


build() {
  cd "$_pkgname-$pkgver"
  qmake-qt4 PREFIX="/usr/"
  make
}



package() {
  cd "$_pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}

