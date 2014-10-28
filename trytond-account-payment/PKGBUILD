# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-payment
_pkgname=trytond_account_payment
pkgver=3.4.0
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_payment module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-company>=3.4' 'trytond-currency>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("9bf1a0e5df77d47149df855dc4afbc9a")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}