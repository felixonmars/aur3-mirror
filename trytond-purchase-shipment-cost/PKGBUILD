# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-purchase-shipment-cost
_pkgname=trytond_purchase_shipment_cost
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The purchase_shipment_cost module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-carrier>=3.4' 'trytond-currency>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("3bb6ffc551988560e35c8f241b6fbf81")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}