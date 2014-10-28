# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-supply-forecast
_pkgname=trytond_stock_supply_forecast
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_supply_forecast module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-stock-supply>=3.4' 'trytond-stock-forecast>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("e4105892710efab98d10adff45563c7e")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}