# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-forecast
_pkgname=trytond_stock_forecast
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_forecast module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company>=3.4' 'trytond-product>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("a2e441b90b7d58911ab014e3cae70e45")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}