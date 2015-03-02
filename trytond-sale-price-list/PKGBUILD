# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-sale-price-list
_pkgname=trytond_sale_price_list
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The sale_price_list module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-party>=3.4' 'trytond-product-price-list>=3.4' 'trytond-sale>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("fa0987619ca01cad757eca23bfea497e")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}