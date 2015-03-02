# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-calendar
_pkgname=trytond_calendar
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The calendar module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("aff0e92d2ba474b6879ed8f9ec00b131")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}