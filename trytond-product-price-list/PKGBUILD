# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-product-price-list
_pkgname=trytond_product_price_list
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The product_price_list module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company>=3.4' 'trytond-product>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("f34a582b0778e180308bd514c8904d9b")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}