# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-payment-sepa
_pkgname=trytond_account_payment_sepa
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_payment_sepa module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-payment>=3.4' 'trytond-company>=3.4' 'trytond-bank>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("23548db6a1c4e31903998d3b09ae902e")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}