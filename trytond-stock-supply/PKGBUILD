# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-stock-supply
_pkgname=trytond_stock_supply
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The stock_supply module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-account>=3.4' 'trytond-party>=3.4' 'trytond-product>=3.4' 'trytond-purchase>=3.4' 'trytond-stock>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("0b052c437f8a53292fbfd583a2e08965")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}