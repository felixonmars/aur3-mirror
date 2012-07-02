#Contributor: Thomas Dziedzic
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=pywps
pkgver=3.2.1
pkgrel=1
pkgdesc="Python Web Processing Service is an implementation of the WPS standard from Open Geospatial Consortium."
arch=(any)
url="http://pywps.wald.intevation.org/"
license=('GPLv2')
depends=(python2-lxml python2-distribute)
makedepends=$depends
source=(http://wald.intevation.org/frs/download.php/910/$pkgname-$pkgver.tgz)
md5sums=('5917f72978074217d5aa147ca2bf999d')

build() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="$pkgdir"
}
