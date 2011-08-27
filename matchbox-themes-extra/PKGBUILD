# Contributor: Alois Belaska <lloyd@centrum.cz>
pkgname=matchbox-themes-extra
pkgver=0.3
pkgrel=3
pkgdesc="Various extra themes for matchbox"
arch=('i686' 'x86_64')
depends=()
url="http://projects.o-hand.com/matchbox"
source=(http://projects.o-hand.com/matchbox/sources/$pkgname/0.3/$pkgname-$pkgver.tar.bz2)
md5sums=('04312628f4a21f4105bce1251ea08035')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
