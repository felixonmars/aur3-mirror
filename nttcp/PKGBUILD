# Contributor: Vasco Costa <vasco.costa@meiodigital.com>
pkgname=nttcp
pkgver=1.47
pkgrel=1
pkgdesc="Much more convenient version of the ttcp program"
arch=(i686)
url="http://www.leo.org/~elmar/nttcp/"
license=('GPL')
depends=('glibc')
source=(http://fresh.t-systems-sfr.com/unix/src/privat2/$pkgname-$pkgver.tar.gz)
md5sums=('05cc30409e6f2cb8cfdf40334d1dcd77')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make ARCH= || return 1
  make prefix=$startdir/pkg/usr install
}
