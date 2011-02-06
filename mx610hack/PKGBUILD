#Contributor: Juls
pkgname=mx610hack
pkgver=0.3
pkgrel=1
pkgdesc="Hack for the Logitech mx610 mouse"
url="http://www.frogmouth.net"
license=""
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.frogmouth.net/$pkgname-$pkgver.tar.gz)
md5sums=('dc304b67b6b1617f6263595bd2c9d5a3')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
