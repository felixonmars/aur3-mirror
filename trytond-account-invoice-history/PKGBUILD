# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-invoice-history
_pkgname=trytond_account_invoice_history
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_invoice_history module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-invoice>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("946f234380610860c54e794a514d2b16")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}