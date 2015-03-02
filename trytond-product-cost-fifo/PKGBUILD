# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-product-cost-fifo
_pkgname=trytond_product_cost_fifo
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The product_cost_fifo module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-product>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("144f9066765b969bf7384cde1305a56a")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}