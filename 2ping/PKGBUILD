#Maintainer: Tehacjusz Flovus (thc_flow) <flow@krolnet.pl>

pkgname=2ping
pkgver=1.0
pkgrel=2
arch=('any')
pkgdesc="Bi-directional ping utility"
url="http://www.finnie.org/software/2ping/"
license=('GPL')
depends=('perl>=5.6.0 perl-digest-sha1 perl-digest-hmac')
makedepends=('pkgconfig')
source=("http://www.finnie.org/software/2ping/$pkgname-$pkgver.tar.gz")
md5sums=('049f246274618e17d24d2ac0323e8061')

build() {
  cd $srcdir/$pkgname-$pkgver
  make test &&
  make PREFIX=$pkgdir/usr install
}
