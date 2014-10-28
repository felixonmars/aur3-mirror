# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-payment-clearing
_pkgname=trytond_account_payment_clearing
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_payment_clearing module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-payment>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("d9c0c187c4089ceef782f47f46ef3438")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}