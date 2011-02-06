# Contributor: lydgate
pkgname=otrproxy
pkgver=0.3.1
pkgrel=1
pkgdesc="OTR localhost AIM proxy"
url="http://www.cypherpunks.ca/otr/"
makedepends=(wxwidgets)
depends=(libotr libgcrypt gtk2 libxxf86vm)
source=(http://www.cypherpunks.ca/otr/$pkgname-$pkgver.tar.gz)
md5sums=('cb6eceae6839c842cf51dee22e266527')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
