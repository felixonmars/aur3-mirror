# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-currency
_pkgname=trytond_currency
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The currency module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("0bceb6e32905adebfabc0a038909f285")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}