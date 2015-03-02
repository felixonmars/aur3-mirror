# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-dashboard
_pkgname=trytond_dashboard
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The dashboard module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("3a8b925464be86b5b1268d09d3ad0355")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}