# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-purchase
_pkgname=trytond_purchase
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The purchase module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-account-invoice>=3.4' 'trytond-account-invoice-stock>=3.4' 'trytond-account-product>=3.4' 'trytond-company>=3.4' 'trytond-currency>=3.4' 'trytond-party>=3.4' 'trytond-product>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("fa02b5d4e05ae354f92b8a4c192e9c68")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}