# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-location-sequence
_pkgname=trytond_stock_location_sequence
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_location_sequence module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("0460a5f22d1bbfe42220559640c78c14")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}