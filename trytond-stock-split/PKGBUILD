# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-split
_pkgname=trytond_stock_split
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_split module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("6c673320c29d011307ff2808246870ec")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}