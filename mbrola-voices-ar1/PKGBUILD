# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-ar1
pkgver=981103
pkgrel=2
pkgdesc="An arabic male voice for mbrola."
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-ar)
depends=(mbrola)
license=(custom)
source=(http://tcts.fpms.ac.be/synthesis/mbrola/dba/ar1/ar1-$pkgver.zip)
md5sums=('2e7012597e1cec0072f177c369fc3e38')

build(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cd ar1
  mv license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  mkdir -p $pkgdir/usr/share/mbrola/ar1/
  cp ar1 $pkgdir/usr/share/mbrola/ar1/
  cp -r TEST $pkgdir/usr/share/mbrola/ar1/
}
