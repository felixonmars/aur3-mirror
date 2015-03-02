# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-sale-shipment-cost
_pkgname=trytond_sale_shipment_cost
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The sale_shipment_cost module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-invoice>=3.4' 'trytond-carrier>=3.4' 'trytond-currency>=3.4' 'trytond-sale>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("6deb3f05ca0ebfba7d4b6ce88439ff2c")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}