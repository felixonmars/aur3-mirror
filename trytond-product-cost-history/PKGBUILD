# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-product-cost-history
_pkgname=trytond_product_cost_history
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The product_cost_history module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-product>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("a6efc06fe49beabda5bbecb8874f320b")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}