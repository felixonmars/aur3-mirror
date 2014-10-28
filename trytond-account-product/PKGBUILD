# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-product
_pkgname=trytond_account_product
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_product module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-company>=3.4' 'trytond-product>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("6940314036e81484181464ee9a6d4f40")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}