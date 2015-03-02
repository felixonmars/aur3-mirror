# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-sale-opportunity
_pkgname=trytond_sale_opportunity
pkgver=3.4.2
_pkgdir=3.4
pkgrel=1
pkgdesc="The sale_opportunity module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-company>=3.4' 'trytond-currency>=3.4' 'trytond-party>=3.4' 'trytond-product>=3.4' 'trytond-sale>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("a3107a3d8fdbe75e2f7e98ac0d65e37c")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}