# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-product
_pkgname=trytond_product
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The product module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("bc9bcac4a2b8300c470890ea1cddebe2")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}