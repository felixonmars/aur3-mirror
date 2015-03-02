# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-supply-day
_pkgname=trytond_stock_supply_day
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_supply_day module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-purchase>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("e5cd1bfee5f91d06c190d367af334442")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}