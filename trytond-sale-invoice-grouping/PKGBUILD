# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-sale-invoice-grouping
_pkgname=trytond_sale_invoice_grouping
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The sale_invoice_grouping module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-party>=3.4' 'trytond-account-invoice>=3.4' 'trytond-sale>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("1b3199ce74c3f069166c94e9191b841a")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}