# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-carrier-percentage
_pkgname=trytond_carrier_percentage
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The carrier_percentage module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-carrier>=3.4' 'trytond-currency>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("c6fe7b2c1c2a8fe8a8ca124f8eebf56a")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}