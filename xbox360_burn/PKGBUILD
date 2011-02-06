# Contributor: Cagnulein <cagnulein@tin.it>
pkgname=xbox360_burn
pkgver=0.7
pkgrel=1
pkgdesc="backup your xbox360 games easily with linux"
url="http://cagnulein.no-ip.info/xbox360_burn"
license="GPL"
arch=('i686')
depends=('sg3_utils')
source=(http://cagnulein.no-ip.info/$pkgname/$pkgname-$pkgver.1.tar.gz)
md5sums=('523f12ce9d00c690ae9f51f4df373502')

build() {
  mkdir -p $startdir/pkg/usr/bin
  cp $startdir/src/$pkgname-$pkgver/$pkgname $startdir/pkg/usr/bin
}
