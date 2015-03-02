# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-account-statement
_pkgname=trytond_account_statement
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The account_statement module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-account-invoice>=3.4' 'trytond-company>=3.4' 'trytond-currency>=3.4' 'trytond-party>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("1beb6fe62a860f0b07db0cbe63a5661a")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}