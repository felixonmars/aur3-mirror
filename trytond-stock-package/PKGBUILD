# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-package
_pkgname=trytond_stock_package
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_package module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("e43b02d20bc06982218c0399d453b561")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}