# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=trytond-timesheet-cost
_pkgname=trytond_timesheet_cost
pkgver=3.4.1
_pkgdir=3.4
pkgrel=1
pkgdesc="The timesheet_cost module of the Tryton application platform"
arch=('any')
url='http://www.tryton.org/'
license=('GPL3')
groups=('trytond-modules')
depends=('trytond>=3.4' 'trytond-company>=3.4' 'trytond-timesheet>=3.4')
makedepends=('python2-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$_pkgname-$pkgver.tar.gz")
md5sums=("99871e3d9a8ad16f39eb09414b1b27ce")

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}