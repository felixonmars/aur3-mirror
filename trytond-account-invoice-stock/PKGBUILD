# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-invoice-stock
_pkgname=trytond_account_invoice_stock
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_invoice_stock module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-invoice>=3.4' 'trytond-stock>=3.4' 'trytond-product>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("8b817d42940cfddca814dd9c383c328c")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}