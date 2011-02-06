# Maintainer: Mikkel Hansen <acid@tuxin.dk>
# Contributor: Tomas Groth <tomasgroth@yahoo.dk>
pkgname=ispell-da
pkgver=1.7.36
pkgrel=1
pkgdesc="Danish dictionary for ispell"
depends=('ispell')
url="http://da.speling.org/"
source=(http://da.speling.org/filer/ispell-da-$pkgver.tar.gz)
arch=('x86_64' 'i686' 'ppc')
license=('GPL')
md5sums=('e2ed0d17ac59f1cf51fc30f68fd61eeb')

build() {
  mkdir -p $startdir/pkg/usr/lib/ispell
  cd $startdir/src/$pkgname-$pkgver
  make installdir=$startdir/pkg/usr/lib/ispell install
}
