# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-sale-credit-limit
_pkgname=trytond_sale_credit_limit
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The sale_credit_limit module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account-credit-limit>=3.4' 'trytond-sale>=3.4' 'trytond-currency>=3.4' 'trytond-account-invoice>=3.4' 'trytond-company>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("f3562c120d81b2989ba66dba6753d5ed")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}