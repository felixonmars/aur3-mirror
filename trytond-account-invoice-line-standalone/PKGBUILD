# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-invoice-line-standalone
_pkgname=trytond_account_invoice_line_standalone
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_invoice_line_standalone module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-invoice>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("558963ba86d7a9bf64d08f63473dd2ab")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}